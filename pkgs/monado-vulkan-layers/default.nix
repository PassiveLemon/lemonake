{ lib, getPackage, ... }: {
  flake.overlays = {
    monado-vulkan-layers = final: prev: {
      monado-vulkan-layers = lib.warn "The package monado-vulkan-layers has been renamed to monado-vulkan-layers-git. This alias may be removed in the future" final.monado-vulkan-layers-git;

      monado-vulkan-layers-git = let
        package = getPackage "monado-vulkan-layers-git" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

