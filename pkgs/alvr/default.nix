{ getPackage, ... }: {
  flake.overlays = {
    alvr = final: prev: {
      alvr = let
        package = getPackage "alvr" prev;
      in
      prev.alvr.overrideAttrs (prevAttrs: {
        inherit (package) version src;
      });

      alvr-git = let
        package = getPackage "alvr-git" prev;
      in
      prev.alvr.overrideAttrs (prevAttrs: {
        inherit (package) version src;
      });
    };
  };
}

