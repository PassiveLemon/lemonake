{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    nimpad = final: prev: {
      nimpad = packager "nimpad" ./package.nix prev;
    };
  };
}

