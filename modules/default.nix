{
  flake = {
    nixosModules = {
      # Remove on Feb 24 2025
      alvr = import ./nixos/alvr;
      autoadb = import ./nixos/autoadb;
      wivrn = import ./nixos/wivrn;
    };
    homeManagerModules = {
      steamvr = import ./home-manager/steamvr;
    };
  };
}

