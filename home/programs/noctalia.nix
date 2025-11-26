{ pkgs, inputs, ... }:
{
  # import the home manager module
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  # https://github.com/noctalia-dev/noctalia-shell/blob/main/Assets/settings-default.json
  # All configurable options can be found in the link above and wrong configurations will be ignored
  # So be careful with the option that is legally configurable
  programs.noctalia-shell = {
    enable = true;
    settings = {
      dock.enabled = false; # disable dock, be careful 'enabled' but not 'enable'
      bar.widgets = {
        left = [
          { id = "ControlCenter"; }
          {
            id = "SystemMonitor";
            showCpuUsage = true;
            showCpuTemp = true;
            showMemoryUsage = true;
            showMemoryAsPercent = true;
            showNetworkStats = true;
          }
          { id = "ActiveWindow"; }
          { id = "MediaMini"; }
        ];
        center = [
          { id = "Workspace"; }
        ];
        right = [
          { id = "Taskbar"; }
          { id = "Tray"; }
          { id = "NotificationHistory"; }
          { id = "Volume"; }
          { id = "Microphone"; }
          { id = "Clock"; }
        ];
      };
      wallpaper = {
        randomEnabled = true;
        overviewEnabled = true;
        defaultWallpaper = "/home/Clo91eaf/Pictures/wallpaper/100102207_p0.jpg";
        directory = "/home/Clo91eaf/Pictures/wallpaper";
      };
    };
  };
}
