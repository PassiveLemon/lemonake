{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    somewm = final: prev: {
      somewm = packager "somewm" ./package.nix prev { };

      somewm-git = (packager "somewm-git" ./package.nix prev { }).overrideAttrs {
        # https://github.com/trip-zip/somewm/commit/c29d0f2728cb5e4c50085faffa1c2d6d319a542a
        installPhase = ''
          runHook preInstall

          mkdir -p $out/bin/
          install -m755 somewm $out/bin/somewm
          install -m755 somewm-client $out/bin/somewm-client

          mkdir -p $out/share/wayland-sessions/
          install -m644 $src/somewm.desktop.in $out/share/wayland-sessions/somewm.desktop

          substituteInPlace $out/share/wayland-sessions/somewm.desktop \
            --replace-fail 'Exec=@exec@' 'Exec=somewm' \

          runHook postInstall
        '';
      };
    };
  };
}

