{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    webfisher = final: prev: {
      webfisher = packager "webfisher" ./package.nix prev;
    };
  };
}

