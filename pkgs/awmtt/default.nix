{ ... }: {
  flake.overlays = {
    awmtt = final: prev: {
      awmtt-git = prev.callPackage ./package.nix { };
    };
  };
}

