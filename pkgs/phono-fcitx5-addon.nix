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
    url = "https://github.com/phono-project/phono-core/releases/download/v0.1.1/phono-core-sdk-0.1.1-linux-x86_64.tar.gz";
    hash = "sha256-zOHMrf9n0Z3E81vJrf8Hk+c00InelgFacJKGxRKEx70=";
  };
in
stdenv.mkDerivation {
  pname = "phono-fcitx5-addon";
  version = "0.1.2";

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

  # Keep the raw composition inline in the application, matching Rime's
  # "Composing text" preedit mode instead of duplicating it in the panel.
  postPatch = ''
    substituteInPlace src/addon.cpp \
      --replace-fail '        panel.setPreedit(preedit);' ""
  '';

  doCheck = true;

  # The Fcitx punctuation and fullwidth modules are optional dependencies and
  # are provided by fcitx5-chinese-addons in the NixOS module.
  checkPhase = ''
    runHook preCheck
    ctest --output-on-failure -E feature_tests
    runHook postCheck
  '';

  meta = {
    description = "Phono Chinese Pinyin and Shuangpin input methods for Fcitx5";
    homepage = "https://github.com/phono-project/phono-fcitx5-addon";
    license = lib.licenses.asl20;
    platforms = [ "x86_64-linux" ];
  };
}
