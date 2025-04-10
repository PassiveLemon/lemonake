{ lib, flake-parts-lib, ... }:
let
  inherit (lib) mkOption types;
  inherit (flake-parts-lib) mkTransposedPerSystemModule;
in
mkTransposedPerSystemModule {
  name = "nonRedistributablePackages";
  option = mkOption {
    type = types.listOf types.str;
    default = { };
    description = ''
      An attribute set of packages with a non-redistributable license.
    '';
  };
  file = ./parts/nonRedistributablePackages.nix;
}

