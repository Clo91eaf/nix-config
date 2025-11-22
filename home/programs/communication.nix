{ pkgs, pkgs-stable, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    feishu
    (qq.override {
      commandLineArgs = "--wayland-text-input-version=3";
    })
  ];
}
