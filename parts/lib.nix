{ config, lib, ... }:
let
  inherit (lib) extend removePrefix;
in
extend (final: _: {
# Shortcut to import modules with the custom lib
  subImport = path: import path {
    inherit config;
    lib = final;
  };

  # Get packages from nvfetcher
  getPackage = pname: pkgs: (pkgs.callPackage ../_sources/generated.nix { }).${pname};

  # Version formatting
  versionRemovePrefix = version: removePrefix "v" version;
  versionGitDateToUnstable = date: "0-unstable-${date}";

  # Get the appropriately formatted version from an nvfetcher source
  versionFromPackage = pkg:
    if pkg ? "date"
    then final.versionGitDateToUnstable pkg.date
    else final.versionRemovePrefix pkg.version;

  # Call a package with a source from nvfetcher
  packager = pname: path: pkgs:
    let
      pkg = final.getPackage pname pkgs;
      src = pkg.src;
      version = final.versionFromPackage pkg;
    in
    pkgs.callPackage path { inherit version src; };

  # Override a package with a source from nvfetcher
  overlayPackager = pname: overridePkg: pkgs:
    let
      pkg = final.getPackage pname pkgs;
      src = pkg.src;
      version = final.versionFromPackage pkg;
    in
    pkgs.${overridePkg}.overrideAttrs { inherit version src; };
})

