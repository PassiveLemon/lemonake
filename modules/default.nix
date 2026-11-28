{
  flake = {
    nixosModules = {
      autoadb = import ./nixos/autoadb;
    };
  };
}

