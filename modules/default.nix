{
  flake = {
    nixosModules = {
      alvr = import ./nixos/alvr;
      autoadb = import ./nixos/autoadb;
      wivrn = import ./nixos/wivrn;
    };
    homeManagerModules = {
      steamvr = import ./home-manager/steamvr;
    };
  };
}

