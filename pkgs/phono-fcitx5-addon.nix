{
  boost,
  cmake,
  fetchurl,
  fcitx5,
  gettext,
  lib,
  libime,
  ninja,
  nlohmann_json,
  pkg-config,
  python3,
  stdenv,
  src,
}:

let
  coreSdk = fetchurl {
    url = "https://github.com/phono-project/phono-core/releases/download/v0.1.2/phono-core-sdk-0.1.2-linux-x86_64.tar.gz";
    hash = "sha256-0lH8dWh+0xJXTJ7l3V/xTdGcSQ6HVetsAEC3GnCtBt0=";
  };
in
stdenv.mkDerivation {
  pname = "phono-fcitx5-addon";
  version = "0.1.3";

  inherit src;

  nativeBuildInputs = [
    cmake
    gettext
    ninja
    pkg-config
    python3
  ];

  buildInputs = [
    boost
    fcitx5
    libime
    nlohmann_json
  ];

  preConfigure = ''
    mkdir -p phono-sdk
    tar -xzf ${coreSdk} -C phono-sdk
    cmakeFlagsArray+=("-DPHONO_SDK_PREFIX=$PWD/phono-sdk")
  '';

  meta = {
    description = "Phono Chinese Pinyin and Shuangpin input methods for Fcitx5";
    homepage = "https://github.com/phono-project/phono-fcitx5-addon";
    license = lib.licenses.asl20;
    platforms = [ "x86_64-linux" ];
  };
}
