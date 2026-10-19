{ config, inputs, ... }:
let
  mellowThemes = inputs."fcitx5-mellow-themes";
  classicUiConfig = "${config.home.homeDirectory}/nix-config/config/fcitx5/classicui.conf";
in
{
  imports = [
    ./rime-ice.nix
  ];

  xdg.dataFile = {
    "fcitx5/themes/mellow-youlan".source = "${mellowThemes}/mellow-youlan";
    "fcitx5/themes/mellow-youlan-dark".source = "${mellowThemes}/mellow-youlan-dark";
  };

  xdg.configFile."fcitx5/conf/classicui.conf".source =
    config.lib.file.mkOutOfStoreSymlink classicUiConfig;
}
