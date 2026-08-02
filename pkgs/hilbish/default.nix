{ lib, ... }:
let
  inherit (lib) overlayPackager; # Custom
  
in
{
  flake.overlays = {
    hilbish = final: prev: {
      hilbish-git = (overlayPackager "hilbish-git" "hilbish" prev).overrideAttrs {
        vendorHash = "sha256-cbcob4b5pqaC/KbzXhFtLF5gsm9Ky364T98xZRlVQP8=";
      };
      # Hilbish with C-lua instead of Golua
      hilbish-midnight-git = final.hilbish-git.overrideAttrs (prevAttrs: let
        lua5_4_patch = final.lua5_4.overrideAttrs (old: {
          # The lua library is not named how golua expects: liblua.so.5.4 (nix) vs liblua5.4.so (golua)
          postInstall = (old.postInstall or "") + ''
            ln -s $out/lib/liblua.so $out/lib/liblua5.4.so
          '';
        });
      in {
        tags = [ "midnight" "lua54" ];
        buildInputs = [ lua5_4_patch ];
        doCheck = false;
      });
    };
  };
}

