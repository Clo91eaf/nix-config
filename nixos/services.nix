{ config, pkgs, ... }:
{
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
      font  = "Noto Sans";
      fontSize = "21";
      loginBackground = true;
    }
  )];

  services = {
    xserver.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-mocha-mauve";
      };
    };

    openvpn.servers = {
      clo91eaf2 = {
        config = "config ${config.age.secrets.ovpn.path}";
      };
    };

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "esc";
              esc = "capslock";
              # https://github.com/rvaiya/keyd/issues/209#issuecomment-1121386837
              rightshift = "rightshift";
              rightcontrol = "rightcontrol";
            };
          };
        };
      };
    };

    # media player controller daemon
    playerctld.enable = true;
  };
}
