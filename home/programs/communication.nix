{ pkgs, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    wemeet
    feishu
    (qq.override {
      commandLineArgs = "--wayland-text-input-version=3";
    })
  ];
}
