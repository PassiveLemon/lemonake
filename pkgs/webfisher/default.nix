{ lib, ... }:
let
  inherit (lib) packager; # Custom
in
{
  flake.overlays = {
    webfisher = final: prev: {
      webfisher = packager "webfisher" ./package.nix prev;
    };
  };
}

