{ getPackage, ... }: {
  flake.overlays = {
    alcom = final: prev: {
      alcom = let
        package = getPackage "alcom" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

