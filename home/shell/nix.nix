{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt
    direnv
    nil
    nixd
    nh
  ];
}
