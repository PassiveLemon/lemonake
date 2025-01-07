{ getPackage, ... }: {
  flake.overlays = {
    xrizer = final: prev: {
      xrizer = let
        package = getPackage "xrizer" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };

      xrizer-git = let
        package = getPackage "xrizer-git" prev;
      in
       final.xrizer.overrideAttrs { inherit (package) version src; };
    };
  };
}

