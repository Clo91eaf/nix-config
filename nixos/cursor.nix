{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
  ];
  xdg.icons.fallbackCursorThemes = [ "Adwaita" ];
}
