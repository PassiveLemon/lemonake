{ lib, ... }:
let
  inherit (lib) packagerGit;
in
{
  flake.overlays = {
    animdl = final: prev: {
      animdl-git = packagerGit "animdl-git" ./package.nix prev.python3Packages;
    };
  };
}

