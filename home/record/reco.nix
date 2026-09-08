{ pkgs, ... }:
{
  home.packages = with pkgs; [
    reco
  ];
}