{ inputs, pkgs, ... }:
let
  _pkgs = inputs.nixpkgs-yet.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  home.packages = [
    _pkgs.splayer-next
  ];
}
