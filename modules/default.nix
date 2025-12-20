{
  flake = {
    nixosModules = {
      autoadb = import ./nixos/autoadb;
      somewm = import ./nixos/somewm;
      wivrn = import ./nixos/wivrn;
    };
    homeModules = {
      somewm = import ./home-manager/somewm;
      steamvr = import ./home-manager/steamvr;
    };
  };
}

