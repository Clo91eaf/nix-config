{ pkgs, config, lib, ... }:
let
  keybinding = "${config.home.homeDirectory}/nix-config/config/vscode/keybindings.json";
  settings = "${config.home.homeDirectory}/nix-config/config/vscode/settings.json";
in
{
  programs.vscode = {
    enable = false;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # utilities
      donjayamanne.githistory
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit

      # vim
      vscodevim.vim
      vspacecode.whichkey

      # themes
      sdras.night-owl
      enkia.tokyo-night

      # ai
      # github.copilot

      # lsp
      # colejcummins.llvm-syntax-highlighting
      jnoortheen.nix-ide
      mkhl.direnv
    ];
  };

  # Only write the config files when VSCode is actually enabled.
  xdg.configFile = lib.mkIf config.programs.vscode.enable {
    "Code/User/keybindings.json".source = config.lib.file.mkOutOfStoreSymlink keybinding;
    "Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink settings;
  };
}
