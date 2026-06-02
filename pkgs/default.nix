{ self, inputs, config, lib, pkgs, ... }:
let
  inherit (lib) readDir attrNames filterAttrs map foldl';
  libLemonake = import ../parts/lib.nix { inherit config lib pkgs; };

  pkgsDir = readDir "${./.}";

  overlayPkgs = attrNames (filterAttrs (_: type: type == "directory") pkgsDir);

  overlayImports = map (name: (libLemonake.subImport ./${name})) overlayPkgs;

  updateOverlays = map (name: self.overlays.${name}) overlayPkgs;

  # Overlay final and prev are here, updateOverlays could become input to apply different overlays, say for aarch64 and/or darwin
  genOverlay = final: prev: foldl' (acc: f: acc // (f final prev)) { } updateOverlays;
in
{
  imports = [
    ./ci.nix
  ] ++ overlayImports;

  flake.overlays = {
    default = self.overlays.linux;

    linux = genOverlay;
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

