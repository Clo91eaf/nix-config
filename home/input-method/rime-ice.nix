{ config, ... }:
let
  defaultConfigPath = "${config.home.homeDirectory}/nix-config/config/rime/ice/default.custom.yaml";
  iceConfigPath = "${config.home.homeDirectory}/nix-config/config/rime/wanxiang/ice.custom.yaml";
in
{
  xdg.dataFile."fcitx5/rime/default.custom.yaml".source = config.lib.file.mkOutOfStoreSymlink defaultConfigPath;
  xdg.dataFile."fcitx5/rime/ice.custom.yaml".source = config.lib.file.mkOutOfStoreSymlink iceConfigPath;
}
