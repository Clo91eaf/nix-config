{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
        eamodio.gitlens
        github.copilot
        github.copilot-chat
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
