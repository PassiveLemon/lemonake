{
  description = "Lemon's flake repo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, ... } @ inputs:
  inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      ./pkgs
    ];
    flake = {
      nixosModules = {
        alvr = import ./modules/nixos/alvr;
        
        wivrn = import ./modules/nixos/wivrn;
      };
      homeManagerModules = {
        steamvr = import ./modules/home-manager/steamvr;
      };
    };
  };
}
