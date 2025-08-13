{ lib, ... }:
let
  inherit (lib) overlayPackager;
in
{
  flake.overlays = {
    opencomposite = final: prev: {
      opencomposite-git = overlayPackager "opencomposite-git" "opencomposite" prev { };
    };
  };
}

