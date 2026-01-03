{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    direnv
    nix-output-monitor
  ];
}
