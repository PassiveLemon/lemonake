{ getPackage, ... }: {
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

      gdlauncher = final.gdlauncher-carbon;
    };
  };
}

