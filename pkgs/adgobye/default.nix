{ getPackage, ... }: {
  flake.overlays = {
    adgobye = final: prev: {
      adgobye = let
        package = getPackage "adgobye" prev;
      in
      prev.callPackage ./package.nix {
        inherit (package) src;
        versionRaw = package.version;
      };

      adgobye-git = let
        package = getPackage "adgobye-git" prev;
      in
      final.adgobye.override {
        inherit (package) src;
        versionRaw = package.version;
      };
    };
  };
}

