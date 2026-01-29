{ mylib, ... }:
{
  imports = mylib.scanPaths ./.;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Enable networking
  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  environment = {
    variables = {
      # set the default editor to vim
      EDITOR = "vim";
      VISUAL = "vim";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";

      # https://docs.noctalia.dev/getting-started/faq/
      QT_QPA_PLATFORMTHEME = "gtk3";
      QS_ICON_THEME = "Adwaita";
    };
  };
}
