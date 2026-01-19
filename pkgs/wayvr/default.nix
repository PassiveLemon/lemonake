{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage;
in
{
  flake.overlays = {
    wayvr = final: prev: {
      wayvr = let
        package = getPackage "wayvr" prev;
      in
      prev.wayvr.overrideAttrs (finalAttrs: prevAttrs: {
        inherit (package) src;
        version = versionFromPackage package;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
      });

      wayvr-git = let
        package = getPackage "wayvr-git" prev;
      in
      prev.wayvr.overrideAttrs (finalAttrs: prevAttrs: {
        inherit (package) src;
        version = versionFromPackage package;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
      });
    };
  };
}

