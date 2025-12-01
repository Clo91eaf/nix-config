{
  config,
  pkgs,
  ...
}:
let
  niriConfigPath = "${config.home.homeDirectory}/nix-config/home/niri/niri.config";
in
{
  home.packages = with pkgs; [
    xwayland-satellite
  ];

  # https://nixos-and-flakes.thiscute.world/zh/best-practices/accelerating-dotfiles-debugging
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink niriConfigPath;

  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit
}
