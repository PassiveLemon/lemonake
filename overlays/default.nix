{ self, lib, getPackage, ... }: {
  flake.overlays = {
    default = self.overlays.linux;
  
    linux = _: prev: rec {
      alvr = let
        package = getPackage "alvr" prev;
        archive = getPackage "alvr-archive" prev;
      in
      prev.callPackage ../pkgs/alvr {
        inherit (package) version src;
        alvrSrc = archive.src;
      };

      animdl = lib.warn "The package animdl has been renamed to animdl-git and may be removed in the future" animdl-git;

      animdl-git = let
        package = getPackage "animdl-git" prev;
      in
      prev.python3Packages.callPackage ../pkgs/animdl { inherit (package) version src; };

      gdlauncher-legacy = prev.callPackage ../pkgs/gdlauncher/legacy.nix {
        version = "1.1.30";
        hash = "sha256-4cXT3exhoMAK6gW3Cpx1L7cm9Xm0FK912gGcRyLYPwM=";
      };
      gdlauncher-carbon = prev.callPackage ../pkgs/gdlauncher/carbon.nix {
        version = "2.0.20";
        hash = "sha256-tI9RU8qO3MHbImOGw2Wl1dksNbhqrYFyGemqms8aAio=";
      };
      gdlauncher-carbon-unstable = gdlauncher-carbon.override {
        version = "2.0.20";
        hash = "sha256-tI9RU8qO3MHbImOGw2Wl1dksNbhqrYFyGemqms8aAio=";
      };
      gdlauncher = gdlauncher-carbon;

      gfm = prev.callPackage ../pkgs/gfm { };

      hd2pystratmacro = let
        package = getPackage "hd2pystratmacro" prev;
      in
      prev.python3Packages.callPackage ../pkgs/hd2pystratmacro { inherit (package) version src; };

      hd2pystratmacro-git = let
        package = getPackage "hd2pystratmacro-git" prev;
      in
      hd2pystratmacro.override { inherit (package) version src; };

      monado-vulkan-layers-git = let
        package = getPackage "monado-vulkan-layers-git" prev;
      in
      prev.callPackage ../pkgs/monado-vulkan-layers { inherit (package) version src; };

      poepyautopot = let
        package = getPackage "poepyautopot" prev;
      in
      prev.python3Packages.callPackage ../pkgs/poepyautopot { inherit (package) version src; };
      
      poepyautopot-git = let
        package = getPackage "poepyautopot-git" prev;
      in
      poepyautopot.override { inherit (package) version src; };

      tilp2 = prev.callPackage ../pkgs/tilp2 { inherit gfm; };

      wivrn = let
        package = getPackage "wivrn" prev;
      in
      prev.callPackage ../pkgs/wivrn { inherit (package) version src; };

      wivrn-git = let
        package = getPackage "wivrn-git" prev;
      in
      wivrn.override { inherit (package) version src; };
    };
  };
}

