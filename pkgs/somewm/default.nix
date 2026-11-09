{ lib, ... }:
let
  inherit (lib) packager; # Custom
in
{
  flake.overlays = {
    somewm = final: prev: let 
      wlrootsSrc = prev.fetchurl {
        url = "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.20.2/downloads/wlroots-0.20.2.tar.gz";
        sha256 = "80c567d2ed4efb2cfa6b077f22c7a710d9c78ba4e185a75e8694001114af0733";
      };
    in {
      somewm = (packager "somewm" ./package.nix prev).overrideAttrs {
        # Remove when https://github.com/trip-zip/somewm/commit/2168891dd1616942850a0bca8ba8999499b512a1 is released
        preConfigure = ''
          mkdir -p subprojects/packagecache
          cp ${wlrootsSrc} subprojects/packagecache/wlroots-0.20.2.tar.gz
        '';
        depsBuildBuild = [ prev.pkg-config ];
      };
    
      somewm-git = packager "somewm-git" ./package.nix prev;
    };
  };
}

