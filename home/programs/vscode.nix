{ pkgs, ... }: {
  home.packages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        eamodio.gitlens
        github.copilot
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