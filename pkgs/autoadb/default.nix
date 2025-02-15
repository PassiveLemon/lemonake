{ ... }: {
  flake.overlays = {
    autoadb = final: prev: {
      autoadb-git = prev.callPackage ./package.nix { };
    };
  };
}

