{ inputs, pkgs, ... }:
{
  home.packages = with inputs; [
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
