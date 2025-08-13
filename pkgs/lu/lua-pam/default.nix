{ getPackage, ... }: {
  flake.overlays = {
    lua-pam = final: prev: {
      lua-pam-git = let
        package = getPackage "lua-pam-git" prev;
      in
      prev.callPackage ./package.nix { inherit (package) version src; };
    };
  };
}

