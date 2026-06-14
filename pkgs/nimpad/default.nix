{ lib, ... }:
let
  inherit (lib) packager; # Custom
in
{
  flake.overlays = {
    nimpad = final: prev: {
      nimpad = packager "nimpad" ./package.nix prev;
    };
  };
}

