{ pkgs, inputs, ... }:
{
  # import the home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = {
      dock.displayMode = "auto_hide";
      wallpaper = {
        randomEnabled = true;
        overviewEnabled = true;
        defaultWallpaper = "/home/Clo91eaf/Pictures/wallpaper/100102207_p0.jpg";
        directory = "/home/Clo91eaf/Pictures/wallpaper";
      };
    };
  };
}
