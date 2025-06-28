{ lib, ... }:
let
  inherit (lib) packager packagerGit;
in
{
  flake.overlays = {
    hd2pystratmacro = final: prev: {
      hd2pystratmacro = packager "hd2pystratmacro" ./package.nix prev.python3Packages;

      hd2pystratmacro-git = packagerGit "hd2pystratmacro-git" ./package.nix prev.python3Packages;
    };
  };
}

