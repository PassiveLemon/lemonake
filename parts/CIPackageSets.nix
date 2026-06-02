{ lib, flake-parts-lib, ... }:
let
  inherit (lib) mkOption types;
  inherit (flake-parts-lib) mkTransposedPerSystemModule;
in
mkTransposedPerSystemModule {
  name = "CIPackageSets";
  option = mkOption {
    type = types.attrs;
    default = { };
    description = ''
      An attribute set of package lists for CI
    '';
  };
  file = ./parts/CIPackageSets.nix;
}

