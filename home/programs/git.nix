{ pkgs, ... }:
{
  home.packages = [
    pkgs.git
    pkgs.gh
  ];

  programs.git = {
    enable = true;
  };
}
