{ getPackage, ... }: {
  flake.overlays = {
    hd2pystratmacro = final: prev: {
      hd2pystratmacro = let
        package = getPackage "hd2pystratmacro" prev;
      in
      prev.python3Packages.callPackage ./package.nix { inherit (package) version src; };

      hd2pystratmacro-git = let
        package = getPackage "hd2pystratmacro-git" prev;
      in
      final.hd2pystratmacro.override { inherit (package) version src; };
    };
  };
}

