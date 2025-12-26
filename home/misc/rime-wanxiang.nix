{ config, ... }:
let
  configPath = "${config.home.homeDirectory}/nix-config/home/misc/rime-wanxiang.yaml";
in
{
  xdg.dataFile."fcitx5/rime/default.custom.yaml".source =
    config.lib.file.mkOutOfStoreSymlink configPath;
}
