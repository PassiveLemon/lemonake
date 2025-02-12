{ lib, getPackage, ... }: {
  flake.overlays = {
    xrizer = final: prev: {
      xrizer = let
        package = getPackage "xrizer" prev;
      in
      prev.xrizer.overrideAttrs {
        inherit (package) src;
        version = (lib.removePrefix "v" package.version);
      };

      xrizer-git = let
        package = getPackage "xrizer-git" prev;
      in
      prev.xrizer.overrideAttrs { inherit (package) version src; };
    };
  };
}

