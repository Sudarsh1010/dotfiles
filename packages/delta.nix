{
  autoPatchelfHook,
  lib,
  libGL,
  libx11,
  makeWrapper,
  requireFile,
  stdenv,
  vulkan-loader,
  wayland,
  xkeyboard_config,
}:
# Delta (https://delta.dev) — Zed Industries' collaborative agent workspace.
# Closed beta: no public source, so this wraps the official Linux tarball
# (autoPatchelf'ed for NixOS). Based on nur.repos.merrkry.delta.
#
# Downloads from https://delta.dev/download require signing in and accepting
# the beta terms, so the tarball can't be fetched inside the derivation.
# After downloading `delta-linux-x86_64.tar.gz`, add it to the store once:
#
#   nix-prefetch-url file://$PWD/delta-linux-x86_64.tar.gz
#
# To bump: update `version`, download the new tarball, re-run the command
# above, and replace `hash` with the new one (build error will tell you).
stdenv.mkDerivation {
  __structuredAttrs = true;

  pname = "delta";
  version = "0.17.0";

  src = requireFile {
    name = "delta-linux-x86_64.tar.gz";
    hash = "sha256-+AUZre1HCN2hzmF95jY0Xs0n4Fd/yPnfCTG+QGBt6MU=";
    message = ''
      Download delta-linux-x86_64.tar.gz from https://delta.dev/download
      (requires signing in and accepting the beta terms), then add it to the
      Nix store with:

        nix-prefetch-url file://$PWD/delta-linux-x86_64.tar.gz
    '';
  };

  sourceRoot = "Delta";

  strictDeps = true;
  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

  runtimeDependencies = map lib.getLib [
    libGL
    vulkan-loader
    wayland
  ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -a bin lib share $out/

    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/bin/delta \
      --set-default XKB_CONFIG_ROOT ${xkeyboard_config}/share/X11/xkb \
      --set-default XLOCALEDIR ${libx11}/share/X11/locale
  '';

  meta = {
    description = "Delta — collaborative agent workspace from Zed Industries";
    homepage = "https://delta.dev";
    license = lib.licenses.unfree;
    mainProgram = "delta";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}
