{ lib, ... }:
let
  inherit (lib) overlayPackagerGit;
in
{
  flake.overlays = {
    opencomposite = final: prev: {
      opencomposite-git = overlayPackagerGit "opencomposite-git" "opencomposite" prev;
    };
  };
}

