{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    alcom = final: prev: {
      # TODO: Update using Nixpkgs derivation
      alcom = packager "alcom" ./package.nix prev { };
    };
  };
}

