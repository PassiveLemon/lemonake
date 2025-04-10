{ lib, flake-parts-lib, ... }:
let
  inherit (lib) mkOption types;
  inherit (flake-parts-lib) mkTransposedPerSystemModule;
in
mkTransposedPerSystemModule {
  name = "redistributablePackages";
  option = mkOption {
    type = types.listOf types.str;
    default = { };
    description = ''
      An attribute set of packages with a redistributable license.
    '';
  };
  file = ./parts/redistributablePackages.nix;
}

