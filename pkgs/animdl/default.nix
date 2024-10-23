{ lib, getPackage, ... }: {
  flake.overlays = {
    animdl = final: prev: {
      animdl = lib.warn "The package animdl has been renamed to animdl-git. This alias may be removed in the future" final.animdl-git;

      animdl-git = let
        package = getPackage "animdl-git" prev;
      in
      prev.python3Packages.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

