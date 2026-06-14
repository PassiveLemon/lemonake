{ lib, ... }:
let
  inherit (lib) removePrefix;
  inherit (lib) getPackage; # Custom
in
{
  flake.overlays = {
    alcom = final: prev: {
      alcom-tag = let
        package = getPackage "alcom-tag" prev;
      in
      prev.alcom.overrideAttrs {
        inherit (package) src;
        version = removePrefix "gui-v" package.version;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
        patches = [ ];
        npmDeps = prev.fetchNpmDeps {
          inherit (package) src;
          sourceRoot = "${package.src.name}/vrc-get-gui";
          hash = "sha256-VyA2c2659Kg1DjLmmtvSAivltdraSBNArIu1XGENGmQ=";
        };
      };

      alcom-git = let
        package = getPackage "alcom-git" prev;
      in
      final.alcom-tag.overrideAttrs {
        inherit (package) src;
        version = "0-unstable-${package.date}";
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
      };
    };
  };
}

