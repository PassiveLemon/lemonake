{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage; # Custom
in
{
  flake.overlays = {
    tilp2 = final: prev: {
      tilp2-git = let
        package = getPackage "tilp2-gfm-git" prev;
      in
      prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
        gfm = final.gfm-git;
      };
    };
  };
}

