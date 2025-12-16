{ lib, ... }:
let
  inherit (lib) getPackage versionFromPackage;
in
{
  flake.overlays = {
    wlx-overlay-s = final: prev: {
      wlx-overlay-s = let
        package = getPackage "wlx-overlay-s" prev;
      in
      prev.wlx-overlay-s.overrideAttrs (finalAttrs: prevAttrs: {
        inherit (package) src;
        version = versionFromPackage package;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";

         nativeBuildInputs = prevAttrs.nativeBuildInputs ++ (with prev; [
          cmake
        ]);
      });

      wlx-overlay-s-git = let
        package = getPackage "wlx-overlay-s-git" prev;
      in
      prev.wlx-overlay-s.overrideAttrs (finalAttrs: prevAttrs: {
        inherit (package) src;
        version = versionFromPackage package;
        cargoDeps = final.rustPlatform.importCargoLock package.cargoLock."Cargo.lock";

        postPatch = "";
        buildInputs = prevAttrs.buildInputs ++ (with prev; [
          gdk-pixbuf
          glib
          gtk3
        ]);
        postFixup = ''
          wrapProgram $out/bin/wlx-overlay-s \
            --suffix LD_LIBRARY_PATH : ${prev.lib.makeLibraryPath finalAttrs.buildInputs}

          wrapProgram $out/bin/uidev \
            --suffix LD_LIBRARY_PATH : ${prev.lib.makeLibraryPath (finalAttrs.buildInputs ++ [ prev.vulkan-loader ])}
        '';
        postInstall = ''
          install -Dm644 $src/wlx-overlay-s/wlx-overlay-s.desktop $out/share/applications/wlx-overlay-s.desktop
          install -Dm644 $src/wlx-overlay-s/wlx-overlay-s.svg $out/share/icons/hicolor/scalable/apps/wlx-overlay-s.svg
        '';
      });
    };
  };
}

