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
      }).overrideAttrs (finalAttrs: {
        postUnpack = ''
          ourMonadoRev="${finalAttrs.monado.src.rev}"
          theirMonadoRev=$(sed -n '/FetchContent_Declare(monado/,/)/p' ${finalAttrs.src.name}/CMakeLists.txt | grep "GIT_TAG" | awk '{print $2}')
          if [ ! "$theirMonadoRev" == "$ourMonadoRev" ]; then
            echo "Our Monado source revision doesn't match monado-rev." >&2
            echo "  theirs: $theirMonadoRev" >&2
            echo "    ours: $ourMonadoRev" >&2
            return 1
          fi
        '';
      });

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
        monado = getPackage "wivrn-git-monado" prev;
      in
      (prev.qt6Packages.callPackage ./package.nix {
        inherit (package) version src;
        monadoSrc = monado.src;
      });
    };
  };
}

