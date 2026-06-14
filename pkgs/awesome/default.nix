{ lib, ... }:
let
  inherit (lib) packager; # Custom
in
{
  flake.overlays = {
    awesome = final: prev: {
      awesome-git = packager "awesome-git" ./package.nix prev;

      awesome-luajit-git = final.awesome-git.override { lua = prev.luajit; };
    };
  };
}

