{ config, ... }:
let
  configFile = "${config.home.homeDirectory}/nix-config/config/swayimg/config";
in
{
  programs.swayimg.enable = true;

  # https://nixos-and-flakes.thiscute.world/zh/best-practices/accelerating-dotfiles-debugging
  # Symlink the external config file into the home manager config
  xdg.configFile."swayimg/config".source = config.lib.file.mkOutOfStoreSymlink configFile;
}
