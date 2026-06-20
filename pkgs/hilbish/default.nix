{ lib, ... }:
let
  inherit (lib) overlayPackager; # Custom
in
{
  flake.overlays = {
    hilbish = final: prev: {
      hilbish-git = (overlayPackager "hilbish-git" "hilbish" prev).overrideAttrs {
        vendorHash = "sha256-dx4uNK2hpGEhBP9QKuuchcbWF2wMGTxQ6zPkC6+RFjE=";
      };
      # Hilbish with C-lua instead of Golua
      hilbish-midnight = (overlayPackager "hilbish-midnight" "hilbish" prev).overrideAttrs {
        pname = "hilbish-midnight";
        vendorHash = "sha256-cbcob4b5pqaC/KbzXhFtLF5gsm9Ky364T98xZRlVQP8=";
        # Fails to open .hilbish-history
        doCheck = false;
      };
    };
  };
}

