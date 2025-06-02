{ lib, getPackage, ... }: {
  flake.overlays = {
    wlx-overlay-s = final: prev: {
      wlx-overlay-s = let
        package = getPackage "wlx-overlay-s" prev;
      in
      prev.wlx-overlay-s.overrideAttrs (prevAttrs: {
        inherit (package) src;
        version = (lib.removePrefix "v" package.version);
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";

         nativeBuildInputs = prevAttrs.nativeBuildInputs ++ (with prev; [
          cmake
        ]);
      });

      wlx-overlay-s-git = let
        package = getPackage "wlx-overlay-s-git" prev;
      in
      prev.wlx-overlay-s.overrideAttrs (prevAttrs: {
        inherit (package) version src;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";

        nativeBuildInputs = prevAttrs.nativeBuildInputs ++ (with prev; [
          cmake
        ]);
      });
    };
  };
}

