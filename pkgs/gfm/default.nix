{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    gfm = final: prev: {
      gfm = packager "tilp2-gfm" ./package.nix prev { };

      gfm-git = packager "tilp2-gfm-git" ./package.nix prev { };
    };
  };
}

