{ getPackage, ... }: {
  flake.overlays = {
    poepyautopot = final: prev: {
      poepyautopot = let
        package = getPackage "poepyautopot" prev;
      in
      prev.python3Packages.callPackage ./package.nix { inherit (package) version src; };

      poepyautopot-git = let
        package = getPackage "poepyautopot-git" prev;
      in
      prev.python3Packages.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

