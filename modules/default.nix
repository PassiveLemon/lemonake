{
  flake = {
    nixosModules = {
      autoadb = import ./nixos/autoadb;
      wivrn = import ./nixos/wivrn;
    };
    homeModules = {
      steamvr = import ./home-manager/steamvr;
    };
  };
}

