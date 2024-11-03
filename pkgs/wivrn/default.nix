{ getPackage, ... }: {
  flake.overlays = {
    wivrn = final: prev: {
      wivrn = let
        package = getPackage "wivrn" prev;
        monado = getPackage "wivrn-monado" prev;
      in
      prev.qt6Packages.callPackage ./package.nix {
        inherit (package) version src;
        monadoSrc = monado.src;
      };

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

