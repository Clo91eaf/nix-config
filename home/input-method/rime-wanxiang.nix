{ config, ... }:
let
  defaultConfigPath = "${config.home.homeDirectory}/nix-config/config/rime-wanxiang/default.custom.yaml";
  wanxiangConfigPath = "${config.home.homeDirectory}/nix-config/config/rime-wanxiang/wanxiang.custom.yaml";
in
{
  xdg.dataFile."fcitx5/rime/default.custom.yaml".source =
    config.lib.file.mkOutOfStoreSymlink defaultConfigPath;
  xdg.dataFile."fcitx5/rime/wanxiang.custom.yaml".source =
    config.lib.file.mkOutOfStoreSymlink wanxiangConfigPath;
}
