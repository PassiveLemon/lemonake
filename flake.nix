{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # https://github.com/berberman/nvfetcher/pull/143
    nvfetcher.url = "github:Red-M/nvfetcher";

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
        default = inputs'.nvfetcher.packages.default;
      };
    };
  };
}

