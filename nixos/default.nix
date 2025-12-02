{
  inputs,
  pkgs,
  lib,
  username,
  ...
}:
{
  imports = [
    ./fonts.nix
    ./i18n.nix
    ./nix.nix
    ./programs.nix
    ./services.nix
    ./users.nix
  ];

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
