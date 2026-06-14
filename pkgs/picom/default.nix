{ lib, ... }:
let
  inherit (lib) overlayPackager; # Custom
in
{
  flake.overlays = {
    picom = final: prev: {
      picom = overlayPackager "picom" "picom" prev;

      picom-tag = (overlayPackager "picom-tag" "picom" prev).overrideAttrs {
        nativeInstallCheckInputs = [ ];
      };

      picom-git = (overlayPackager "picom-git" "picom" prev).overrideAttrs {
        nativeInstallCheckInputs = [ ];
      };
    };
  };
}

