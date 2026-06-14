{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage; # Custom
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
        # https://github.com/NixOS/nixpkgs/pull/531078
        nativeBuildInputs = prevAttrs.nativeBuildInputs ++ [
          prev.hexdump
        ];
        buildInputs = prevAttrs.buildInputs ++ [
          prev.kdePackages.kirigami-addons
        ];
        cmakeFlags = prevAttrs.cmakeFlags ++ [
          (prev.lib.cmakeFeature "GIT_COMMIT" package.version)
        ];
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
        cmakeFlags = prevAttrs.cmakeFlags ++ [
          (prev.lib.cmakeFeature "GIT_COMMIT" package.version)
        ];
      });
    };
  };
}

