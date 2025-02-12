{ lib, getPackage, ... }: {
  flake.overlays = {
    adgobye = final: prev: {
      adgobye = let
        package = getPackage "adgobye" prev;
      in
      prev.callPackage ./package.nix {
        inherit (package) src;
        version = (lib.removePrefix "v" package.version);
      };

      adgobye-git = let
        package = getPackage "adgobye-git" prev;
      in
      final.adgobye.override {
        inherit (package) src;
        # Some manipulation of the version string to pass the "is not a valid version string" check
        version = "0-${package.version}";
      };
    };
  };
}

