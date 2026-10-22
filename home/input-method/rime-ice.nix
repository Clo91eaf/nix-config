{ config, ... }:
let
  defaultConfigPath = "${config.home.homeDirectory}/nix-config/config/rime/ice/default.custom.yaml";
  iceConfigPath = "${config.home.homeDirectory}/nix-config/config/rime/ice/rime_ice.custom.yaml";
in
{
  xdg.dataFile."fcitx5/rime/default.custom.yaml".source =
    config.lib.file.mkOutOfStoreSymlink defaultConfigPath;
  xdg.dataFile."fcitx5/rime/rime_ice.custom.yaml".source =
    config.lib.file.mkOutOfStoreSymlink iceConfigPath;
}
