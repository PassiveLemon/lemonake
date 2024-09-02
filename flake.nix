{
  description = "Lemon's flake repo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, ... } @ inputs:
  inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [ ./overlays ];
    systems = [ "x86_64-linux" ];

    _module.args.getPackage = pname: pkgs: (pkgs.callPackage ./_sources/generated.nix { }).${pname};

    perSystem = { lib, system, ... }:
    let
      pkgs = import inputs.nixpkgs {
        inherit system;
        allowUnfree = true;
        overlays = [ self.overlays.default ];
      };
    in
    {
      _module.args.pkgs = pkgs;

      packages = self.overlays.linux pkgs pkgs;
    };
    
    flake = {
      nixosModules = {
        alvr = import ./modules/nixos/alvr;

        autoadb = import ./modules/nixos/autoadb;

        wivrn = import ./modules/nixos/wivrn;
      };
      homeManagerModules = {
        steamvr = import ./modules/home-manager/steamvr;

        tmodloader-dotnetfix = import ./modules/home-manager/tmodloader-dotnetfix;
      };
    };
  };
}

