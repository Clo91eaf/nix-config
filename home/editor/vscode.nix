{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      Google.gemini-cli-vscode-ide-companion
      eamodio.gitlens
      github.copilot
      github.copilot-chat
      jnoortheen.nix-ide
      mkhl.direnv
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      colejcummins.llvm-syntax-highlighting
      sdras.night-owl
      vscodevim.vim
      vspacecode.whichkey
    ];
  };
}
