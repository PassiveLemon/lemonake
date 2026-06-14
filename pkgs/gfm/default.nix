{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    gfm = final: prev: {
      gfm-git = packager "tilp2-gfm-git" ./package.nix prev;
    };
  };
}

