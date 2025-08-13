{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage packager;
in
{
  flake.overlays = {
    wayvr-dashboard = final: prev: {
      wayvr-dashboard = let
        package = getPackage "wayvr-dashboard" prev;
      in
      (prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
      }).overrideAttrs {
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."src-tauri/Cargo.lock";
      };

      wayvr-dashboard-git = let
        package = getPackage "wayvr-dashboard-git" prev;
      in
      (prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
      }).overrideAttrs {
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."src-tauri/Cargo.lock";
      };

      wayvr-dashboard-appimage = packager "wayvr-dashboard-appimage" ./package-appimage.nix prev { };

      wayvr-dashboard-binary = packager "wayvr-dashboard-binary" ./package-binary.nix prev { };
    };
  };
}

