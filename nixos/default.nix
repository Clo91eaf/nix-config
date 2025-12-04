{
  inputs,
  pkgs,
  lib,
  mylib,
  username,
  ...
}:
{
  imports = mylib.scanPaths ./.;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Enable networking
  networking = {
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
    };
  };
}
