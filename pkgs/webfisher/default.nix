{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    webfisher = final: prev: {
      webfisher = packager "webfisher" ./package.nix prev { };

      webfisher-git = packager "webfisher-git" ./package.nix prev { };
    };
  };
}

