{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    somewm = final: prev: {
      # The current (as of 12/20/25) somewm stable release does not build in nix
      #somewm = packager "somewm" ./package.nix prev { };
      somewm = packager "somewm-git" ./package.nix prev { };

      somewm-git = packager "somewm-git" ./package.nix prev { };
    };
  };
}

