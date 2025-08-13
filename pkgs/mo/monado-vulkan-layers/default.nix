{ getPackage, ... }: {
  flake.overlays = {
    monado-vulkan-layers = final: prev: {
      monado-vulkan-layers-git = let
        package = getPackage "monado-vulkan-layers-git" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

