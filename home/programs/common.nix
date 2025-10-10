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

    # utils
    ripgrep
    fastfetch
    ttyper

    btop
    jq

    # connects
    openvpn
    tigervnc

    # editor
    vim

    # communication
    telegram-desktop
    wemeet
    feishu
    qq
    wechat
  ];

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

    eza = {
      enable = true;
      theme = "tokyonight";
    };
  };
}
