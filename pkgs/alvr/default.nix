{ lib, ... }: {
  flake.overlays = {
    alvr = final: prev: {
      # Remove on Feb 24 2025
      alvr = lib.warn "ALVR is no longer being vendored in Lemonake. This warning will be removed in the future." prev.alvr;
      alvr-git = final.alvr;
    };
  };
}

