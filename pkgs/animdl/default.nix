{ getPackage, ... }: {
  flake.overlays = {
    animdl = final: prev: {
      animdl-git = let
        package = getPackage "animdl-git" prev;
      in
      prev.python3Packages.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

