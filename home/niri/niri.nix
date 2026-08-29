{ config, pkgs, ... }:
let
  configFile = "${config.home.homeDirectory}/nix-config/config/niri/config.kdl";
  noctaliaConfigFile = "${config.home.homeDirectory}/nix-config/config/niri/noctalia.kdl";
in
{
  home.packages = with pkgs; [
    xwayland-satellite
    nautilus
  ];

  # https://nixos-and-flakes.thiscute.world/zh/best-practices/accelerating-dotfiles-debugging
  # Symlink the external config file into the home manager config
  xdg.configFile."niri/noctalia.kdl".source = config.lib.file.mkOutOfStoreSymlink noctaliaConfigFile;
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink configFile;
}
