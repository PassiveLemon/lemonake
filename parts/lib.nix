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

  # Implement some way to add optional overrideAttrs
  packager = pname: path: pkgs:
    let
      package = final.getPackage pname pkgs;
    in
    pkgs.callPackage path {
      inherit (package) src;
      version = removePrefix "v" package.version;
    };

  packagerGit = pname: path: pkgs:
    let
      package = final.getPackage pname pkgs;
    in
    pkgs.callPackage path { inherit (package) version src; };

  overlayPackager = pname: overridePkg: pkgs:
    let
      package = final.getPackage pname pkgs;
    in
    pkgs.${overridePkg}.overrideAttrs {
      inherit (package) src;
      version = removePrefix "v" package.version;
    };

  overlayPackagerGit = pname: overridePkg: pkgs:
    let
      package = final.getPackage pname pkgs;
    in
    pkgs.${overridePkg}.overrideAttrs { inherit (package) version src; };
})

