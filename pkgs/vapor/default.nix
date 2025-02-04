{ getPackage, ... }: {
  flake.overlays = {
    vapor = final: prev: {
      vapor-git = let
        package = getPackage "vapor-git" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

