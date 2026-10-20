{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage; # Custom
in
{
  flake.overlays = {
    somewm = final: prev: {
      somewm = let
        package = getPackage "somewm" prev;
        wlroots = getPackage "somewm-wlroots" prev;
      in
      (prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
        wlrHash = wlroots.version;
        wlrVer = prev.wlroots_0_20.version;
      }).overrideAttrs {
        postPatch = ''
          substituteInPlace tests/test-render.c \
            --replace-fail 'freopen("/dev/null", "w", stderr);' 'if (!freopen("/dev/null", "w", stderr)) { _exit(1); }' \
        '';
      };

      somewm-git = let
        package = getPackage "somewm-git" prev;
        wlroots = getPackage "somewm-git-wlroots" prev;
      in
      prev.callPackage ./package.nix {
        inherit (package) src;
        version = versionFromPackage package;
        wlrHash = wlroots.version;
        wlrVer = prev.wlroots_0_20.version;
      };
    };
  };
}

