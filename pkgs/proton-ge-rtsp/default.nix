{ lib, ... }:
let
  inherit (lib) overlayPackager;
in
{
  flake.overlays = {
    proton-ge-rtsp = final: prev: {
      proton-ge-rtsp = (overlayPackager "proton-ge-rtsp" "proton-ge-bin" prev { }).override { steamDisplayName = "GE-Proton-rtsp"; };
    };
  };
}

