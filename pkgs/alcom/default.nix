{ lib, getPackage, ... }: {
  flake.overlays = {
    alcom = final: prev: {
      alcom = let
        package = getPackage "alcom" prev;
      in
      # TODO: Update using Nixpkgs derivation
      prev.callPackage ./package.nix {
        inherit (package) src;
        version = (lib.removePrefix "v" package.version);
      };
    };
  };
}

