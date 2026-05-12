{ lib, ... }:
let
  inherit (lib) getPackage removePrefix;
in
{
  flake.overlays = {
    alcom = final: prev: {
      alcom = let
        package = getPackage "alcom" prev;
      in
      prev.alcom.overrideAttrs {
        inherit (package) src;
        version = removePrefix "gui-v" package.version;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
      };

      alcom-git = let
        package = getPackage "alcom-git" prev;
      in
      prev.alcom.overrideAttrs {
        inherit (package) src;
        version = "0-unstable-${package.date}";
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
      };
    };
  };
}

