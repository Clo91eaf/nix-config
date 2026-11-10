{ inputs, pkgs, ... }:

let
  clashVergePkgs = inputs.clash-verge-nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs = {
    ssh.enableAskPassword = false;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    # vpn
    clash-verge = {
      enable = true;
      package = clashVergePkgs.clash-verge-rev;
      tunMode = true;
      serviceMode = true;
    };

    # niri
    niri.enable = true;
  };
}
