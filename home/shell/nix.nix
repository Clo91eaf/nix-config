{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt
    direnv
    nix-output-monitor
  ];
}
