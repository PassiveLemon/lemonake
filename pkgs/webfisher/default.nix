{ getPackage, ... }: {
  flake.overlays = {
    webfisher = final: prev: {
      webfisher = let
        package = getPackage "webfisher" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };

      webfisher-git = let
        package = getPackage "webfisher-git" prev;
      in
      final.webfisher.overrideAttrs { inherit (package) version src; };
    };
  };
}

