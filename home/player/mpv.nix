{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mpv
  ];

  programs.mpv.config.volume = 10;
}
