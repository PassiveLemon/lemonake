{ getPackage, ... }: {
  flake.overlays = {
    wayvr-dashboard = final: prev: {
      wayvr-dashboard = let
        package = getPackage "wayvr-dashboard" prev;
      in
      (prev.callPackage ./package.nix { inherit (package) version src; }).overrideAttrs {
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."src-tauri/Cargo.lock";
      };

      wayvr-dashboard-git = let
        package = getPackage "wayvr-dashboard-git" prev;
      in
      (prev.callPackage ./package.nix { inherit (package) version src; }).overrideAttrs {
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."src-tauri/Cargo.lock";
      };

      wayvr-dashboard-appimage = let
        package = getPackage "wayvr-dashboard-appimage" prev;
      in
      (prev.callPackage ./package-appimage.nix { inherit (package) version src; });
    };
  };
}

