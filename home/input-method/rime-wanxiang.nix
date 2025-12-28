{ config, ... }:
let
  defaultConfigPath = "${config.home.homeDirectory}/nix-config/home/input-method/default.custom.yaml";
  wanxiangConfigPath = "${config.home.homeDirectory}/nix-config/home/input-method/wanxiang.custom.yaml";
in
{
  xdg.dataFile."fcitx5/rime/default.custom.yaml".source =
    config.lib.file.mkOutOfStoreSymlink defaultConfigPath;
  xdg.dataFile."fcitx5/rime/wanxiang.custom.yaml".source =
    config.lib.file.mkOutOfStoreSymlink wanxiangConfigPath;
}
