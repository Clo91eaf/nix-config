{ pkgs, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    wemeet
    feishu
    qq
  ];
}
