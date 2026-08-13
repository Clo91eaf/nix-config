{
  pkgs,
  config,
  inputs,
  ...
}:
let
  keybinding = "${config.home.homeDirectory}/nix-config/config/zed/keymap.json";
  settings = "${config.home.homeDirectory}/nix-config/config/zed/settings.json";

  # pkgs extended with the nix-zed-extensions overlay (provides
  # buildZedRustExtension / buildZedGrammar).
  zedExtPkgs = pkgs.extend inputs.zed-extensions.overlays.default;

  # The stock nixpkgs build compiles remote_server in the GUI invocation and
  # produces a dynamically linked binary. Build it separately below so it can
  # be a portable musl executable and so the editor does not build it twice.
  # Everything in the zed chain (editor, remote server, its toolchain) is built
  # from the pinned zed-nixpkgs revision so the version never drifts when the
  # main nixpkgs input is updated.
  zedNixpkgs = import inputs.zed-nixpkgs { system = pkgs.stdenv.hostPlatform.system; };

  unpatchedZedEditor = zedNixpkgs.zed-editor.override { buildRemoteServer = false; };

  unprocessedZedRemoteServer = zedNixpkgs.callPackage ./zed-remote-server.nix {
    inherit unpatchedZedEditor;
  };

  zedRemoteServer = zedNixpkgs.callPackage ./zed-remote-server-package.nix {
    unprocessedRemoteServer = unprocessedZedRemoteServer;
  };

  # Zed 1.12.0 classifies symlinked extensions as development extensions
  # unless a `.zed-extension-checksum` receipt is present. Write that receipt
  # in postInstall so the packaged extensions we symlink into place are
  # recognized as packaged, not dev.
  withExtensionChecksum =
    extension:
    extension.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        for extension_dir in "$out"/share/zed/extensions/*; do
          if [ -d "$extension_dir" ]; then
            (
              set -o pipefail
              cd "$extension_dir"
              find . \( -type f -o -type l \) ! -name .zed-extension-checksum -print0 \
                | LC_ALL=C sort -z \
                | xargs -0 sha256sum \
                | sha256sum \
                | cut -d ' ' -f 1 > .zed-extension-checksum
            )
          fi
        done
      '';
    });

  zed-editor = unpatchedZedEditor.overrideAttrs (oldAttrs: {
    patches = (oldAttrs.patches or [ ]) ++ [
      ./zed-no-automatic-downloads.patch
      ./zed-local-remote-server.patch
      ./zed-extension-checksums.patch
    ];

    env = (oldAttrs.env or { }) // {
      ZED_BUNDLED_REMOTE_SERVER = "${zedRemoteServer}/share/zed/remote_server.gz";
      ZED_BUNDLED_REMOTE_SERVER_OS = if pkgs.stdenv.hostPlatform.isLinux then "linux" else "macos";
      ZED_BUNDLED_REMOTE_SERVER_ARCH = if pkgs.stdenv.hostPlatform.isx86_64 then "x86_64" else "aarch64";
    };

    passthru = (oldAttrs.passthru or { }) // {
      remote_server = zedRemoteServer;
    };
  });
in
{
  imports = [ inputs.zed-extensions.homeManagerModules.default ];

  programs.zed-editor-extensions = {
    enable = true;
    packages =
      map withExtensionChecksum (
        with zedExtPkgs.zed-extensions; [
          catppuccin-blur
          catppuccin-icons
          git-firefly
          nix
          toml
        ]
      )
      ++ [
        (withExtensionChecksum inputs.scala3-bsp-semantic-ls-zed.packages.${pkgs.stdenv.hostPlatform.system}.default)
      ];
  };

  home.packages = [ zed-editor ];

  xdg.configFile."zed/keymap.json".source = config.lib.file.mkOutOfStoreSymlink keybinding;
  xdg.configFile."zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink settings;
}
