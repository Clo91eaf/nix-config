{ pkgs, config, ... }:
let
  keybinding = "${config.home.homeDirectory}/nix-config/config/zed/keymap.json";
  settings = "${config.home.homeDirectory}/nix-config/config/zed/settings.json";
in
{
  home.packages = with pkgs; [
    zed-editor
  ];

  xdg.configFile."zed/keymap.json".source = config.lib.file.mkOutOfStoreSymlink keybinding;
  xdg.configFile."zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink settings;
}