{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    vapor = final: prev: {
      vapor-git = packager "vapor-git" ./package.nix prev;
    };
  };
}

