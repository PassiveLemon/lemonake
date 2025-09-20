{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs = { ... } @ inputs:
  inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" ];

    imports = [
      ./modules
      ./pkgs
      ./parts/devshells.nix
      ./parts/redistributablePackages.nix
      ./parts/nonRedistributablePackages.nix
    ];

    perSystem = { self', system, ... }:
    let
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      devShells = {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nvfetcher jq act
          ];
        };
      };
      packages = {
        default = pkgs.nvfetcher;
      };
    };
  };
}

