{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    xwayland-satellite
  ];

  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit
}
