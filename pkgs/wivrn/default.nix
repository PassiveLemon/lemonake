{ getPackage, ... }: {
  flake.overlays = {
    wivrn = final: prev: {
      wivrn = let
        package = getPackage "wivrn" prev;
        monado = getPackage "wivrn-monado" prev;
      in
      (prev.qt6Packages.callPackage ./package.nix {
        inherit (package) version src;
        monadoSrc = monado.src;
      }).overrideAttrs {
        patches = [
          (prev.fetchpatch {
            name = "fix-translations-with-qt-6-8";
            url = "https://github.com/WiVRn/WiVRn/commit/be95ec84b56794ca8d97bb8b21dec6443ba57bc4.diff";
            sha256 = "sha256-4qcHvnXunUhT32dt66K+GlVH/g4rd8x1AMAwWQk++JI=";
          })
        ];
      };

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
        monado = getPackage "wivrn-git-monado" prev;
      in
      (final.wivrn.override {
        inherit (package) version src;
        monadoSrc = monado.src;
      }).overrideAttrs {
        patches = [ ];
      };
    };
  };
}

