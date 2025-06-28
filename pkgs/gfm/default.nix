{ lib, ... }:
let
  inherit (lib) packager packagerGit;
in
{
  flake.overlays = {
    gfm = final: prev: {
      gfm = packager "tilp2-gfm" ./package.nix prev;

      gfm-git = packagerGit "tilp2-gfm-git" ./package.nix prev;
    };
  };
}

