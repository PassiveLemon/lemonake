{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    monado-vulkan-layers = final: prev: {
      monado-vulkan-layers-git = packager "monado-vulkan-layers-git" ./package.nix prev.python3Packages { };
    };
  };
}

