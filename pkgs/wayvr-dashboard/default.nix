{ getPackage, ... }: {
  flake.overlays = {
    wayvr-dashboard = final: prev: {
      # wayvr-dashboard = let
      #   package = getPackage "wayvr-dashboard" prev;
      # in
      # prev.callPackage ./package.nix { inherit (package) version src; };

      wayvr-dashboard-git = let
        package = getPackage "wayvr-dashboard-git" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

