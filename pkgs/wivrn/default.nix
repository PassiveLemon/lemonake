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
        cmakeFlags = removeCmakeFlags [ "GIT_DESC" "GIT_COMMIT" ] prevAttrs.cmakeFlags ++ [
          # Replace when released: https://github.com/WiVRn/WiVRn/commit/29b1770ba0b15d9409899a49d39d128ddb4dfd2e
          # (cmakeFeature "GIT_TAG" package.version)
          (cmakeFeature "GIT_DESC" package.version)
          (cmakeFeature "GIT_COMMIT" package.version)
        ];
      });

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
        monado = getPackage "wivrn-git-monado" prev;
      in
      final.wivrn.overrideAttrs (_: prevAttrs: {
        inherit (package) src;
        version = versionFromPackage package;
        monado = prev.applyPatches {
          inherit (prevAttrs.monado) postPatch;
          src = monado.src;
        };
        cmakeFlags = removeCmakeFlags [ "GIT_TAG" ] prevAttrs.cmakeFlags ++ [
          (cmakeFeature "GIT_DESC" (substring 0 8 package.version))
          (cmakeFeature "GIT_COMMIT" package.version)
        ];
      });
    };
  };
}

