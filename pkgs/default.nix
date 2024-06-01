{ inputs, config, lib, ... }: {
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

  systems = [ "x86_64-linux" ];

  perSystem = { config, system, pkgs, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    packages = with pkgs;
    let
      gdlauncherPackages = (import ./gdlauncher { inherit pkgs; });
    in
    rec {
      alvr = callPackage ./alvr { };

      animdl = python3Packages.callPackage ./animdl { };

      gdlauncher-legacy = gdlauncherPackages.legacy;
      gdlauncher-carbon = gdlauncherPackages.carbon;
      gdlauncher-carbon-unstable = gdlauncherPackages.carbon-unstable;
      gdlauncher = gdlauncher-carbon;

      gfm = callPackage ./gfm { };

      hd2pystratmacro = python3Packages.callPackage ./hd2pystratmacro { };

      monado-vulkan-layers = callPackage ./monado-vulkan-layers { };

      poepyautopot = python3Packages.callPackage ./poepyautopot { };

      tilp2 = callPackage ./tilp2 { inherit gfm; };

      wivrn = callPackage ./wivrn { };
    };
  };
}

# Manually update:
# nix run /home/lemon/Documents/GitHub/lemonake#packages.x86_64-linux.<package>
# Until I set up NVFetcher or something to automatically do this.
