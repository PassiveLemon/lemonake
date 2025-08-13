{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage;
in
{
  flake.overlays = {
    xrizer = final: prev: {
      xrizer = let
        package = getPackage "xrizer" prev;
      in
      prev.xrizer.overrideAttrs {
        inherit (package) src;
        version = versionFromPackage package;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
      };

      xrizer-git = let
        package = getPackage "xrizer-git" prev;
      in
      prev.xrizer.overrideAttrs {
        inherit (package) src;
        version = versionFromPackage package;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
      };
    };
  };
}

