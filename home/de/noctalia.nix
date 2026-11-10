{ config, pkgs, ... }:
let
  configFile = "${config.home.homeDirectory}/nix-config/config/noctalia/config.toml";
in
{
  home.packages = with pkgs; [
    noctalia
  ];

  xdg.configFile."noctalia/config.toml".source = config.lib.file.mkOutOfStoreSymlink configFile;
}
