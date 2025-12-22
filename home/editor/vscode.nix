{ pkgs, ... }:
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
      Google.gemini-cli-vscode-ide-companion

      # lsp
      colejcummins.llvm-syntax-highlighting
      jnoortheen.nix-ide
      mkhl.direnv
    ];
  };
}
