{ pkgs, ... }:
let
  # MiSans (Xiaomi) — the closest freely-licensed Chinese sans-serif to
  # macOS PingFang SC. The official zip is ~230MB; this pinned GitHub mirror
  # ships the same 10 static weights as TTFs in a much smaller tarball.
  mi-sans = pkgs.stdenvNoCC.mkDerivation {
    pname = "mi-sans";
    version = "2022-11-05";
    src = pkgs.fetchFromGitHub {
      owner = "boyan01";
      repo = "mi_sans_font";
      rev = "68f3ec3fee5830ce8a1d955d462fa0df401a5341";
      hash = "sha256-miEvTj343LI/cmcmFkODouL6USrjcZ6DCaQveFS4Iyo=";
    };
    installPhase = ''
      runHook preInstall
      install -Dm644 lib/fonts/*.ttf -t $out/share/fonts/truetype/misans
      runHook postInstall
    '';
  };
in
{
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons

      # normal fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      # chinese fonts
      lxgw-wenkai
      mi-sans

      # program fonts
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif CJK SC" ];
      # MiSans first: closer to the macOS (PingFang) look the user wants;
      # Noto remains as the CJK fallback for glyphs MiSans doesn't cover.
      sansSerif = [ "MiSans" "Noto Sans CJK SC" ];
      monospace = [ "Noto Sans Mono CJK SC" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
