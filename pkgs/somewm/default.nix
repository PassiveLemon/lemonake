{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    somewm = final: prev: {
      somewm = packager "somewm" ./package.nix prev { };

      somewm-git = packager "somewm-git" ./package.nix prev { };
    };
  };
}

