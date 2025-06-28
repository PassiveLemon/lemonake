{ lib, ... }:
let
  inherit (lib) getPackage packager;
in
{
  flake.overlays = {
    adgobye = final: prev: {
      adgobye = packager "adgobye" ./package.nix prev;

      adgobye-git = let
        package = getPackage "adgobye-git" prev;
      in
      prev.callPackage ./package.nix {
        inherit (package) src;
        # Some manipulation of the version string to pass the "is not a valid version string" check
        version = "0-${package.version}";
      };
    };
  };
}

