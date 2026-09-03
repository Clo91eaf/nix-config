{ pkgs, inputs, ... }:
let
  fcitx5-vinput = inputs.fcitx5-vinput.packages."${pkgs.stdenv.hostPlatform.system}".default;
in
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-fluent
        fcitx5-vinput
        (fcitx5-rime.override {
          rimeDataPkgs = [
            # see home/input-method/rime-wanxiang.nix
            # rime-wanxiang
            rime-ice
          ];
        })
      ];
      settings = {
        inputMethod = {
          GroupOrder."0" = "Default";
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "rime";
          };
          "Groups/0/Items/0".Name = "rime";
        };
      };
    };
  };
}
