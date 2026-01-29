{ config, pkgs, ... }:
let
  configFile = "${config.home.homeDirectory}/nix-config/config/noctalia/settings.json";
in
{
  home.packages = with pkgs; [
    noctalia-shell
  ];

  # https://nixos-and-flakes.thiscute.world/zh/best-practices/accelerating-dotfiles-debugging
  # Symlink the external config file into the home manager config
  xdg.configFile."noctalia/settings.json".source = config.lib.file.mkOutOfStoreSymlink configFile;
}
