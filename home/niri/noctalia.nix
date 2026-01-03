{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noctalia-shell
  ];
}
