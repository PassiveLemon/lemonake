{ lib, ... }:
let
  inherit (lib) filter any hasInfix substring cmakeFeature;
  inherit (lib) getPackage versionFromPackage; # Custom
  # Remove each cmake flag that contains a string in remove list
  removeCmakeFlags = remove: flags:
    filter (flag: !(any (r: hasInfix r flag) remove)) flags;
in
{
  flake.overlays = {
    wivrn = final: prev: {
      wivrn = let
        package = getPackage "wivrn" prev;
        monado = getPackage "wivrn-monado" prev;
      in
      prev.wivrn.overrideAttrs (prevAttrs: {
        inherit (package) src;
        version = versionFromPackage package;
        monado = final.applyPatches {
          inherit (prevAttrs.monado) postPatch;
          src = monado.src;
        };
        cmakeFlags = (removeCmakeFlags [ "GIT_DESC" "GIT_COMMIT" ] prevAttrs.cmakeFlags) ++ [
          (cmakeFeature "GIT_TAG" package.version)
          # Only GIT_TAG should be needed, but the builds fail without the others. However, I don't think they actually do anything when GIT_TAG is present
          (cmakeFeature "GIT_DESC" package.version)
          (cmakeFeature "GIT_COMMIT" package.version)
        ];
      });

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
        monado = getPackage "wivrn-git-monado" prev;
      in
      prev.wivrn.overrideAttrs (prevAttrs: {
        inherit (package) src;
        version = versionFromPackage package;
        monado = final.applyPatches {
          inherit (prevAttrs.monado) postPatch;
          src = monado.src;
        };
        cmakeFlags = (removeCmakeFlags [ "GIT_TAG" ] prevAttrs.cmakeFlags) ++ [
          (cmakeFeature "GIT_DESC" (substring 0 8 package.version))
          (cmakeFeature "GIT_COMMIT" package.version)
        ];
      });
    };
  };
}

