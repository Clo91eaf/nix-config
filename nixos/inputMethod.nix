{ pkgs, inputs, ... }:
let
  phonoFcitx5Addon = pkgs.callPackage ../pkgs/phono-fcitx5-addon.nix {
    src = inputs."phono-fcitx5-addon";
  };
in
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-fluent
        phonoFcitx5Addon
        qt6Packages.fcitx5-chinese-addons
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
