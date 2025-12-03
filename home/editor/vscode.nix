{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        Google.gemini-cli-vscode-ide-companion
        eamodio.gitlens
        github.copilot
        github.copilot-chat
        jnoortheen.nix-ide
        mkhl.direnv
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        sdras.night-owl
        vscodevim.vim
        vspacecode.whichkey
      ];
    })
  ];
}
