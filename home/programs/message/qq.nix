{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (qq.override {
      commandLineArgs = "--wayland-text-input-version=3";
    })
  ];
}
