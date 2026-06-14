{ lib, ... }:
let
  inherit (lib) packager; # Custom
in
{
  flake.overlays = {
    vapor = final: prev: {
      vapor-git = packager "vapor-git" ./package.nix prev;
    };
  };
}

