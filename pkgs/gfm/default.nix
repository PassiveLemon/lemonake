{ lib, ... }:
let
  inherit (lib) packager; # Custom
in
{
  flake.overlays = {
    gfm = final: prev: {
      gfm-git = packager "tilp2-gfm-git" ./package.nix prev;
    };
  };
}

