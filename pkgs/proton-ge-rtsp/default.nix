{ lib, ... }:
let
  inherit (lib) getPackage;
in
{
  flake.overlays = {
    proton-ge-rtsp = final: prev: {
      proton-ge-rtsp = let
        package = getPackage "proton-ge-rtsp" prev;
      in
      (prev.proton-ge-bin.overrideAttrs {
        inherit (package) version src;
      }).override { steamDisplayName = "GE-Proton-rtsp"; };
    };
  };
}

