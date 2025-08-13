{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    adgobye = final: prev: {
      adgobye = packager "adgobye" ./package.nix prev { };

      adgobye-git = packager "adgobye-git" ./package.nix prev { };
    };
  };
}

