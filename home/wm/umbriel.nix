{ config, ... }:
let
  configFile = "${config.home.homeDirectory}/nix-config/config/umbriel/config.toml";
in
{
  xdg.configFile."umbriel/config.toml".source = config.lib.file.mkOutOfStoreSymlink configFile;
}
