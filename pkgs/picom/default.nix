{ lib, ... }:
let
  inherit (lib) getPackage overlayPackager;
in
{
  flake.overlays = {
    picom = final: prev: {
      picom = overlayPackager "picom" "picom" prev;

      picom-tag = overlayPackager "picom-tag" "picom" prev;

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

