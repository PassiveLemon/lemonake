{ lib, ... }:
let
  inherit (lib) packager packagerGit;
in
{
  flake.overlays = {
    webfisher = final: prev: {
      webfisher = packager "webfisher" ./package.nix prev;

      webfisher-git = packagerGit "webfisher-git" ./package.nix prev;
    };
  };
}

