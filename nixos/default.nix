{ mylib, ... }:
{
  imports = mylib.scanPaths ./.;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    # Only SSH is exposed; loopback services (QQ, clash, etc.) are unaffected.
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 ];
    };
  };

  environment = {
    variables = {
      # set the default editor to vim
      EDITOR = "vim";
      VISUAL = "vim";
    };

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      XMODIFIERS = "@im=fcitx";
      QS_ICON_THEME = "Adwaita";
    };
  };
}
