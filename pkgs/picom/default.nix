{ lib, ... }:
let
  inherit (lib) overlayPackager;
in
{
  flake.overlays = {
    picom = final: prev: {
      picom = overlayPackager "picom" "picom" prev { };

      picom-tag = overlayPackager "picom-tag" "picom" prev { };

      picom-git = overlayPackager "picom-git" "picom" prev {
        nativeInstallCheckInputs = [ ];
      };
    };
  };
}

