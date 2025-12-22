{ pkgs, ... }:
let
  theme = "tokyonight-night";
in
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "FiraCode Nerd Font:size=12";
        include = [ "${pkgs.foot.themes}/share/foot/themes/${theme}" ];
      };
      mouse = {
        hide-when-typing = true;
      };
      csd = {
        preferred = "none";
      };
      cursor = {
        blink = true;
      };
      colors = {
        alpha = 0.7;
      };
    };
  };
}
