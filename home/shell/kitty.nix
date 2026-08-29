{ config, pkgs, ... }:
let
  configFile = "${config.home.homeDirectory}/nix-config/config/kitty/kitty.conf";
in
{
  home.packages = with pkgs; [
    kitty
  ];
  
  xdg.configFile."kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink configFile;
}
