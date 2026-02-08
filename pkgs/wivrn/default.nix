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
      prev.wivrn.overrideAttrs (_: prevAttrs: {
        inherit (package) src;
        version = versionFromPackage package;
        monado = prev.applyPatches {
          inherit (prevAttrs.monado) postPatch;
          src = monado.src;
        };
      });

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
        monado = getPackage "wivrn-git-monado" prev;
      in
      prev.wivrn.overrideAttrs (_: prevAttrs: {
        inherit (package) src;
        version = versionFromPackage package;
        monado = prev.applyPatches {
          inherit (prevAttrs.monado) postPatch;
          src = monado.src;
        };
      });
    };
  };
}

