{
  description = "Lemon's Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... } @ inputs:
  inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    flake.nixosModules = {
      alvr = import ./modules/alvr.nix;
    };
    imports = [
      ./pkgs
    ];
  };
}
