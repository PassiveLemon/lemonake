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
      (prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
        monadoSrc = monado.src;

        patches = [
          # Needed to allow WiVRn in-stream GUI to launch Steam games
          (prev.fetchpatch {
            name = "wivrn-allow-launching-steam-games.patch";
            url = "https://github.com/WiVRn/WiVRn/commit/30ceab5b3082cbc545acf8bc8ca4a24279e6f738.diff";
            hash = "sha256-BD6MhCET7hdjog8rkl7G2l7/zGfVATpNAhNie0efOlA=";
          })
        ];
      });

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
        monado = getPackage "wivrn-git-monado" prev;
      in
      (prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
        monadoSrc = monado.src;
      });
    };
  };
}

