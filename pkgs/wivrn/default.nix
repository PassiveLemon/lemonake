{ lib, getPackage, ... }: {
  flake.overlays = {
    wivrn = final: prev: {
      wivrn = let
        package = getPackage "wivrn" prev;
        monado = getPackage "wivrn-monado" prev;
      in
      (prev.qt6Packages.callPackage ./package.nix {
        inherit (package) src;
        version = (lib.removePrefix "v" package.version);
        monadoSrc = monado.src;
      }).overrideAttrs (prevAttrs: {
        cmakeFlags = (final.lib.subtractLists [
          (lib.cmakeFeature "OVR_COMPAT_SEARCH_PATH" "${final.opencomposite}:${final.xrizer}")
        ] prevAttrs.cmakeFlags) ++ [
          (lib.cmakeFeature "OPENCOMPOSITE_SEARCH_PATH" "${final.opencomposite}")
        ];
      });

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
        monado = getPackage "wivrn-git-monado" prev;
      in
      final.wivrn.override {
        inherit (package) version src;
        monadoSrc = monado.src;
      };
    };
  };
}

