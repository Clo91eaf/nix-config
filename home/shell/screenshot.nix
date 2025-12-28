{ pkgs, ... }:
{
  # https://github.com/YaLTeR/niri/discussions/1737
  home.packages = with pkgs; [
    grim
    slurp
    satty
  ];
  # set -e; grim -t ppm -g \"$(slurp -o -d -F monospace)\" - | satty --filename - --copy-command=wl-copy --output-filename=\"~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H:%M:%S.png\" --actions-on-enter=\"save-to-clipboard,exit\" --brush-smooth-history-size=5
}
