{ lib, ... }:
let
  inherit (lib) overlayPackager;
in
{
  flake.overlays = {
    picom = final: prev: {
      picom = overlayPackager "picom" "picom" prev { };

      picom-tag = overlayPackager "picom-tag" "picom" prev {
        nativeInstallCheckInputs = [ ];
      };

      picom-git = overlayPackager "picom-git" "picom" prev {
        nativeInstallCheckInputs = [ ];
      };
    };
  };
}

