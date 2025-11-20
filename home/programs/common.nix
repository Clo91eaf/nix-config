{
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # system
    grub2

    # fetch
    wget
    curl

    # archives
    zip
    unzip
    unrar

    # utils
    ripgrep
    fastfetch
    ttyper

    btop
    jq
    wpsoffice-cn

    # connects
    openvpn
    tigervnc

    # editor
    vim

    swaybg # wallpaper
  ];


  programs.alacritty.enable = true; # Super+T in the default setting (terminal)
  programs.fuzzel.enable = true; # Super+D in the default setting (app launcher)
  programs.swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
  programs.waybar.enable = true; # launch on startup in the default setting (bar)
  services.mako.enable = true; # notification daemon
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit

  programs = {
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "catppuccin-mocha";
      };
    };

    ssh = {
      enable = true; # ssh
      extraConfig = ''
        Host 172.24.5.184
        HostName 172.24.5.184
        User clo91eaf

        Host 172.24.6.56
        HostName 172.24.6.56
        User clo91eaf
      '';
    };
  };
}
