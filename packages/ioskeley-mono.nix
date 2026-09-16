{
  lib,
  stdenvNoCC,
  fetchzip,
}:
# Ioskeley Mono (Nerd Font build) from https://github.com/ahatem/IoskeleyMono
# Fontconfig family name: "IoskeleyMono Nerd Font Mono"
stdenvNoCC.mkDerivation rec {
  pname = "ioskeley-mono-nerd-font";
  version = "2.1.0";

  src = fetchzip {
    url = "https://github.com/ahatem/IoskeleyMono/releases/download/v${version}/IoskeleyMono-NerdFont.zip";
    hash = "sha256-b0mqhLeDT+uYPYiOKB+cxc5M1TtFkICKAmlcmW3IjDg=";
    stripRoot = false;
  };

  installPhase = ''
    runHook preInstall
    find . -name '*.ttf' -exec install -Dm644 -t "$out/share/fonts/truetype" {} +
    runHook postInstall
  '';

  meta = {
    description = "Ioskeley Mono — a custom Iosevka build, patched with Nerd Font glyphs";
    homepage = "https://github.com/ahatem/IoskeleyMono";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
}
