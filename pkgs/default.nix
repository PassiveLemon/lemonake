{ self, inputs, config, lib, pkgs, ... }:
let
  libLemonake = import ../parts/lib.nix { inherit config lib pkgs; };

  overlayPackages = [
    "alcom"
    "autoadb"
    "awesome"
    "gdlauncher"
    "gfm"
    "lua-pam"
    "monado-vulkan-layers"
    "nimpad"
    "opencomposite"
    "picom"
    "proton-ge-rtsp"
    "somewm"
    "tilp2"
    "vapor"
    "wayvr"
    "webfisher"
    "wivrn"
    "xrizer"
  ];

  overlayPaths = builtins.map (name: (libLemonake.subImport ./${name})) overlayPackages;
in
{
  perSystem = { system, ... }:
  let
    systemPkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ self.overlays.default ];
    };
    systemLib = systemPkgs.lib;

    inherit (systemLib) isList all attrNames filterAttrs;

    flakePkgs = self.packages.${system};

    testLicense = license:
      license ? redistributable &&
      license.redistributable;

    isRedistributable = pkg:
      pkg.meta ? license &&
      (if isList pkg.meta.license
      then all testLicense pkg.meta.license
      else testLicense pkg.meta.license);

    redistributablePkgs = attrNames (filterAttrs (_: pkg: isRedistributable pkg) flakePkgs);
    nonRedistributablePkgs = attrNames (filterAttrs (_: pkg: ! isRedistributable pkg) flakePkgs);
  in
  {
    packages = self.overlays.default systemPkgs systemPkgs;
    redistributablePackages = redistributablePkgs;
    nonRedistributablePackages = nonRedistributablePkgs;
  };

  imports = overlayPaths;

  flake.overlays = {
    default = self.overlays.linux;

    linux = final: prev:
      let
        overlayFns = builtins.map (name: self.overlays.${name}) overlayPackages;
      in
        builtins.foldl' (acc: f: acc // (f final prev)) { } overlayFns;
  };
}

