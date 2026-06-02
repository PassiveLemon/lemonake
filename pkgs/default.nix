{ self, inputs, config, lib, pkgs, ... }:
let
  inherit (lib) map foldl';
  libLemonake = import ../parts/lib.nix { inherit config lib pkgs; };

  overlayPackages = [
    "alcom"
    "autoadb"
    "awesome"
    "awmtt"
    "gdlauncher"
    "gfm"
    "lua-pam"
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

  overlayPaths = map (name: (libLemonake.subImport ./${name})) overlayPackages;
in
{
  imports = [
    ./ci.nix
  ] ++ overlayPaths;

  flake.overlays = {
    default = self.overlays.linux;

    linux = final: prev:
      let
        overlayFns = map (name: self.overlays.${name}) overlayPackages;
      in
        foldl' (acc: f: acc // (f final prev)) { } overlayFns;
  };

  perSystem = { system, ... }:
  let
    systemPkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ self.overlays.default ];
    };
  in
  {
    packages = self.overlays.default systemPkgs systemPkgs;
  };
}

