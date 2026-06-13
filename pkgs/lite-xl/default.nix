{ lib, ... }:
let
  inherit (lib) overlayPackager;
in
{
  flake.overlays = {
    lite-xl = final: prev: {
      lite-xl-git = overlayPackager "lite-xl-git" "lite-xl" prev;
    };
  };
}

