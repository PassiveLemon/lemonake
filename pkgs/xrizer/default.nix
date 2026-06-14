{ lib, ... }:
let
  inherit (lib) getLib;
  inherit (lib) getPackage versionFromPackage; # Custom
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
      final.xrizer.overrideAttrs {
        inherit (package) src;
        version = versionFromPackage package;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";
        postPatch = ''
          substituteInPlace src/graphics_backends/gl.rs \
            --replace-fail 'libGLX.so.0' '${getLib prev.libGL}/lib/libGLX.so.0'
        '';
      };
    };
  };
}

