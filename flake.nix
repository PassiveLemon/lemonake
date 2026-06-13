{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # https://github.com/berberman/nvfetcher/pull/143
    nvfetcher.url = "github:Red-M/nvfetcher/a84b3ce67f1d7acd85b3aa2b9967ab91ed6e7a71";

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
      ./parts/CIPackageSets.nix
    ];

    perSystem = { inputs', system, ... }:
    let
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      devShells = {
        default = pkgs.mkShell {
          packages = with pkgs; [
            jq act
          ] ++ [
            inputs'.nvfetcher.packages.default
          ];
        };
      };
      packages = {
        default = pkgs.writeShellApplication {
          name = "update";
          runtimeInputs = [ inputs'.nvfetcher.packages.default ];
          text = ''
            nvfetcher
            exit 0
          '';
        };
      };
    };
  };
}

