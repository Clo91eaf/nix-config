# 当前使用 rime-ice 方案(nixos/inputMethod.nix 中 rimeDataPkgs = [ rime-ice ]),
# 因此 wanxiang 方案停用,避免与 rime-ice 同时写 fcitx5/rime/default.custom.yaml。
# 要切回 wanxiang:恢复下方内容,并在 nixos/inputMethod.nix 中把 rime-ice
# 换成 rime-wanxiang。
{ ... }:
{
}
