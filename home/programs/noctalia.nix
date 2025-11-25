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
      dock.enable = false;
      bar.widgets.right = [
        {
          id = "Taskbar";
        }
        {
          id = "Tray";
        }
        {
          id = "NotificationHistory";
        }
        {
          id = "Volume";
        }
        {
          id = "Microphone";
        }
        {
          id = "Clock";
        }
      ];
      wallpaper = {
        randomEnabled = true;
        overviewEnabled = true;
        defaultWallpaper = "/home/Clo91eaf/Pictures/wallpaper/100102207_p0.jpg";
        directory = "/home/Clo91eaf/Pictures/wallpaper";
      };
    };
  };
}
