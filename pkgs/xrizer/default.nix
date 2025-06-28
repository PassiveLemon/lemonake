{ lib, ... }:
let
  inherit (lib) getPackage;
in
{
  flake.overlays = {
    xrizer = final: prev: {
      xrizer = let
        package = getPackage "xrizer" prev;
      in
      prev.xrizer.overrideAttrs {
        inherit (package) src;
        version = (lib.removePrefix "v" package.version);
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
      };

      xrizer-git = let
        package = getPackage "xrizer-git" prev;
      in
      prev.xrizer.overrideAttrs {
        inherit (package) version src;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
      };
    };
  };
}

