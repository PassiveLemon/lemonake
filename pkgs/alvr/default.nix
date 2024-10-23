{ getPackage, ... }: {
  flake.overlays = {
    alvr = final: prev: {
      alvr = let
        package = getPackage "alvr" prev;
        archive = getPackage "alvr-archive" prev;
      in
      prev.callPackage ./package.nix {
        inherit (archive) version src;
        alvrSrc = package.src;
      };
    };
  };
}

