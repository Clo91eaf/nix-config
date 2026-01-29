{ config, pkgs, ... }:
let
  configFile = "${config.home.homeDirectory}/nix-config/config/niri/config.kdl";
in
{
  home.packages = with pkgs; [
    xwayland-satellite
  ];

  # https://nixos-and-flakes.thiscute.world/zh/best-practices/accelerating-dotfiles-debugging
  # Symlink the external config file into the home manager config
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink configFile;
}
