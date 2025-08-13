{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage;
in
{
  flake.overlays = {
    tilp2 = final: prev: {
      tilp2 = let
        package = getPackage "tilp2-gfm" prev;
      in
      prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
        gfm = final.gfm;
      };

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

