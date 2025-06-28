{ lib, ... }:
let
  inherit (lib) packager packagerGit;
in
{
  flake.overlays = {
    poepyautopot = final: prev: {
      poepyautopot = packager "poepyautopot" ./package.nix prev.python3Packages;

      poepyautopot-git = packagerGit "poepyautopot-git" ./package.nix prev.python3Packages;
    };
  };
}

