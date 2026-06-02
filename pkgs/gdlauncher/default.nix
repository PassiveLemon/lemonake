{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    gdlauncher = final: prev: {
      gdlauncher-legacy = packager "gdlauncher-legacy" ./legacy.nix prev;

      gdlauncher-carbon = packager "gdlauncher-carbon" ./carbon.nix prev;

      gdlauncher = final.gdlauncher-carbon;
    };
  };
}

