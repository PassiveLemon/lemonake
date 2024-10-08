{ self, lib, inputs, ... }:
let
  getPackage = pname: pkgs: (pkgs.callPackage ../_sources/generated.nix { }).${pname};
in
{
  flake.overlays = {
    default = self.overlays.linux;

    linux = final: prev: {
      alvr = let
        package = getPackage "alvr" prev;
        archive = getPackage "alvr-archive" prev;
      in
      prev.callPackage ../pkgs/alvr {
        inherit (archive) version src;
        alvrSrc = package.src;
      };

      animdl = lib.warn "The package animdl has been renamed to animdl-git. This alias may be removed in the future" final.animdl-git;

      animdl-git = let
        package = getPackage "animdl-git" prev;
      in
      prev.python3Packages.callPackage ../pkgs/animdl { inherit (package) version src; };

      gdlauncher-legacy = let
        package = getPackage "gdlauncher-legacy" prev;
      in
      prev.callPackage ../pkgs/gdlauncher/legacy.nix { inherit (package) version src; };

      gdlauncher-carbon = let
        package = getPackage "gdlauncher-carbon" prev;
      in
      prev.callPackage ../pkgs/gdlauncher/carbon.nix { inherit (package) version src; };

      gdlauncher-carbon-unstable = lib.warn "The package gdlauncher-carbon-unstable has been removed. It is aliased to gdlauncher-carbon and may be removed in the future." final.gdlauncher-carbon;

      gdlauncher = final.gdlauncher-carbon;

      gfm = let
        package = getPackage "tilp2-gfm" prev;
      in
      prev.callPackage ../pkgs/gfm { inherit (package) version src; };

      gfm-git = let
        package = getPackage "tilp2-gfm-git" prev;
      in
      final.gfm.override { inherit (package) version src; };

      hd2pystratmacro = let
        package = getPackage "hd2pystratmacro" prev;
      in
      prev.python3Packages.callPackage ../pkgs/hd2pystratmacro { inherit (package) version src; };

      hd2pystratmacro-git = let
        package = getPackage "hd2pystratmacro-git" prev;
      in
      final.hd2pystratmacro.override { inherit (package) version src; };

      monado-vulkan-layers = lib.warn "The package monado-vulkan-layers has been renamed to monado-vulkan-layers-git. This alias may be removed in the future" final.monado-vulkan-layers-git;

      monado-vulkan-layers-git = let
        package = getPackage "monado-vulkan-layers-git" prev;
      in
      prev.callPackage ../pkgs/monado-vulkan-layers { inherit (package) version src; };

      # https://gitlab.com/znixian/OpenOVR/-/issues/416
      opencomposite-git = let
        package = getPackage "opencomposite-git" prev;
      in
      prev.opencomposite.overrideAttrs (prevAttrs: {
        inherit (package) version src;

        cmakeFlags = prevAttrs.cmakeFlags ++ [
          (lib.cmakeBool "USE_SYSTEM_OPENXR" false)
        ];
      });

      picom = let
        package = getPackage "picom" prev;
      in
      prev.picom.overrideAttrs { inherit (package) version src; };

      picom-tag = let
        package = getPackage "picom-tag" prev;
      in
      prev.picom.overrideAttrs { inherit (package) version src; };

      picom-git = let
        package = getPackage "picom-git" prev;
      in
      prev.picom.overrideAttrs { inherit (package) version src; };

      poepyautopot = let
        package = getPackage "poepyautopot" prev;
      in
      prev.python3Packages.callPackage ../pkgs/poepyautopot { inherit (package) version src; };

      poepyautopot-git = let
        package = getPackage "poepyautopot-git" prev;
      in
      final.poepyautopot.override { inherit (package) version src; };

      tilp2 = let
        package = getPackage "tilp2-gfm" prev;
      in
      prev.callPackage ../pkgs/tilp2 {
        inherit (package) version src;
        gfm = final.gfm;
      };

      tilp2-git = let
        package = getPackage "tilp2-gfm-git" prev;
      in
      final.tilp2.override {
        inherit (package) version src;
        gfm = final.gfm-git;
      };

      wivrn = let
        package = getPackage "wivrn" prev;
        monado = getPackage "wivrn-monado" prev;
      in
      prev.qt6Packages.callPackage ../pkgs/wivrn {
        inherit (package) version src;
        monadoSrc = monado.src;
      };

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
        monado = getPackage "wivrn-git-monado" prev;
      in
      final.wivrn.override {
        inherit (package) version src;
        monadoSrc = monado.src;
      };
    };
  };
}

