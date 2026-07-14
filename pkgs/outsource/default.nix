{ lib, ... }:
let
  inherit (lib) packager; # Custom
in
{
  flake.overlays = {
    outsource = final: prev: {
      outsource = packager "outsource" ./package.nix prev;
    };
  };
}

