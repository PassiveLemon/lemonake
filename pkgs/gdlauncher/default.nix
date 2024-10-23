{ lib, getPackage, ... }: {
  flake.overlays = {
    gdlauncher = final: prev: {
      gdlauncher-legacy = let
        package = getPackage "gdlauncher-legacy" prev;
      in
      prev.callPackage ./legacy.nix { inherit (package) version src; };

      gdlauncher-carbon = let
        package = getPackage "gdlauncher-carbon" prev;
      in
      prev.callPackage ./carbon.nix { inherit (package) version src; };

      gdlauncher-carbon-unstable = lib.warn "The package gdlauncher-carbon-unstable has been removed. It is aliased to gdlauncher-carbon and may be removed in the future." final.gdlauncher-carbon;

      gdlauncher = final.gdlauncher-carbon;
    };
  };
}

