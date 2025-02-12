{ lib, getPackage, ... }: {
  flake.overlays = {
    picom = final: prev: {
      picom = let
        package = getPackage "picom" prev;
      in
      prev.picom.overrideAttrs {
        inherit (package) src;
        version = (lib.removePrefix "v" package.version);
      };

      picom-tag = let
        package = getPackage "picom-tag" prev;
      in
      prev.picom.overrideAttrs {
        inherit (package) src;
        version = (lib.removePrefix "v" package.version);
      };

      picom-git = let
        package = getPackage "picom-git" prev;
      in
      prev.picom.overrideAttrs {
        inherit (package) version src;

        nativeInstallCheckInputs = [ ];
      };
    };
  };
}

