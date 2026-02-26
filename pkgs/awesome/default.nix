{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage;
in
{
  flake.overlays = {
    awesome = final: prev: {
      awesome-git = let
        package = getPackage "awesome-git" prev;
      in
      (prev.awesome.override {
        gtk3Support = true;
      }).overrideAttrs {
        inherit (package) src;
        version = versionFromPackage package;
        patches = [ ];

        env.GI_TYPELIB_PATH = let
          mkTypeLibPath = pkg: "${pkg}/lib/girepository-1.0";
          extraGITypeLibPaths = lib.forEach (with prev; [
            networkmanager upower playerctl
          ]) mkTypeLibPath;
        in
        lib.concatStringsSep ":" (extraGITypeLibPaths ++ [ (mkTypeLibPath prev.pango.out) ]);

        postPatch = ''
          patchShebangs tests/examples/_postprocess.lua
          patchShebangs tests/examples/_postprocess_cleanup.lua
        '';
      };
      awesome-luajit-git = final.awesome-git.override { lua = prev.luajit; };
    };
  };
}

