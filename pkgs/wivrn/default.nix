{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage;
in
{
  flake.overlays = {
    wivrn = final: prev: {
      wivrn = let
        package = getPackage "wivrn" prev;
        monado = getPackage "wivrn-monado" prev;
      in
      prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
        monadoSrc = monado.src;
      };

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
        monado = getPackage "wivrn-git-monado" prev;
      in
      (prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
        monadoSrc = monado.src;
      });
    };
  };
}

