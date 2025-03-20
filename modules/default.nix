{
  flake = {
    nixosModules = {
      autoadb = import ./nixos/autoadb;
      wivrn = import ./nixos/wivrn;
    };
    homeManagerModules = {
      steamvr = import ./home-manager/steamvr;
    };
  };
}

