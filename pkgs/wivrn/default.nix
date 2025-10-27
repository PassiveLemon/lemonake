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
      }).overrideAttrs {
        patches = [
          # See https://github.com/WiVRn/WiVRn/pull/557
          (prev.fetchpatch {
            name = "wivrn-fix-qt6.10-build.patch";
            url = "https://github.com/WiVRn/WiVRn/commit/2204fdd39682cfc052556d58fdb9404dd8ecf63f.patch?full_index=1";
            hash = "sha256-05MLfJNCznBt6eaggUfSk1jaNDB2/eou6CfexUkIHZE=";
          })
        ];
      };

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

