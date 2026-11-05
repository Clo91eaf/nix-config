{
  config,
  inputs,
  pkgs,
  ...
}:
let
  mellowThemes = inputs."fcitx5-mellow-themes";
  classicUiConfig = "${config.home.homeDirectory}/nix-config/config/fcitx5/classicui.conf";
  phonoModel = pkgs.callPackage ../../pkgs/phono-model.nix { };
in
{
  imports = [
    ./rime-ice.nix
  ];

  xdg.dataFile = {
    "fcitx5/themes/mellow-youlan".source = "${mellowThemes}/mellow-youlan";
    "fcitx5/themes/mellow-youlan-dark".source = "${mellowThemes}/mellow-youlan-dark";
    "phono/models/phonop2c_v2_2_base_w8a8_model".source = phonoModel;
  };

  xdg.configFile."fcitx5/conf/classicui.conf".source =
    config.lib.file.mkOutOfStoreSymlink classicUiConfig;
}
