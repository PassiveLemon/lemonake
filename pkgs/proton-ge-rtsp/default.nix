{ lib, ... }:
let
  inherit (lib) overlayPackager; # Custom
in
{
  flake.overlays = {
    proton-ge-rtsp = final: prev: {
      proton-ge-rtsp = (overlayPackager "proton-ge-rtsp" "proton-ge-bin" prev).overrideAttrs { steamDisplayName = "GE-Proton-rtsp"; };
    };
  };
}

