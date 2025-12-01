{ pkgs, inputs, ... }:
{
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # vpn
  programs.clash-verge = {
    enable = true;
    tunMode = true;
    serviceMode = true;
  };

  # niri
  programs.niri.enable = true;

  # noctalia shell
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
  ];
}
