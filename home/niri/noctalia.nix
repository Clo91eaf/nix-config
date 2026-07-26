{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    #generate config file
    #noctalia config export > /home/Clo91eaf/nix-config/config/noctalia/config.toml
    settings = ../../config/noctalia/config.toml;
  };
}
