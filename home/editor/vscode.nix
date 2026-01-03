{ pkgs, config, ... }:
let
  keybinding = "${config.home.homeDirectory}/nix-config/home/editor/keybindings.json";
  settings = "${config.home.homeDirectory}/nix-config/home/editor/settings.json";
in
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      # utilities
      eamodio.gitlens
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit

      # vim
      vscodevim.vim
      vspacecode.whichkey

      # themes
      sdras.night-owl
      enkia.tokyo-night

      # ai
      github.copilot
      github.copilot-chat

      # lsp
      colejcummins.llvm-syntax-highlighting
      jnoortheen.nix-ide
      mkhl.direnv
    ];
  };

  xdg.configFile."Code/User/keybindings.json".source = config.lib.file.mkOutOfStoreSymlink keybinding;
  xdg.configFile."Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink settings;
}
