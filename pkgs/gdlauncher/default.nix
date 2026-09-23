{ lib, ... }:
let
  inherit (lib) packager; # Custom
in
{
  flake.overlays = {
    gdlauncher = final: prev: {
      gdlauncher = packager "gdlauncher" ./package.nix prev;
    };
  };
}

