{ config, lib, ... }:
let
  inherit (lib) extend removePrefix;
in
extend (final: _: {
  subImport = path: import path {
    inherit config;
    lib = final;
  };

  getPackage = pname: pkgs: (pkgs.callPackage ../_sources/generated.nix { }).${pname};

  versionRemovePrefix = version:
    removePrefix "v" version;

  versionGitDateToUnstable = date:
    "0-unstable-${date}";

  versionFromPackage = pkg: (
    if pkg ? "date"
    then final.versionGitDateToUnstable pkg.date
    else final.versionRemovePrefix pkg.version
  );

  packager = pname: path: pkgs:
    let
      pkg = final.getPackage pname pkgs;
      src = pkg.src;
      version = final.versionFromPackage pkg;
    in
    pkgs.callPackage path { inherit version src; };

  overlayPackager = pname: overridePkg: pkgs:
    let
      pkg = final.getPackage pname pkgs;
      src = pkg.src;
      version = final.versionFromPackage pkg;
    in
    pkgs.${overridePkg}.overrideAttrs { inherit version src; };
})

