{ pkgs, username, ... }:
let
  openvpnConfigPath = "/etc/openvpn/client/clo91eaf2.conf";
in
{
  services = {
    xserver.enable = true;

    displayManager = {
      sddm.enable = true;
      autoLogin = {
        enable = true;
        user = username;
      };
    };

    # backend service of vpn
    mihomo.tunMode = true;

    openvpn.servers = {
      clo91eaf2 = {
        config = " config ${openvpnConfigPath} ";
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
  };
}
