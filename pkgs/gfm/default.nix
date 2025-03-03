{ getPackage, ... }: {
  flake.overlays = {
    gfm = final: prev: {
      gfm = let
        package = getPackage "tilp2-gfm" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };

      gfm-git = let
        package = getPackage "tilp2-gfm-git" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

