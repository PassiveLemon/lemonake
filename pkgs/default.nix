{ inputs, self, ... }: {
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];

  systems = [ "x86_64-linux" ];

  perSystem = { config, system, pkgs, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    overlayAttrs = config.packages;

    packages = with pkgs; rec {
      alvr = callPackage ./alvr { };
      animdl = python3Packages.callPackage ./animdl { };
      gdlauncher = callPackage ./gdlauncher { };
      gdlauncher-carbon = callPackage ./gdlauncher-carbon { };
      gfm = callPackage ./gfm { };
      hd2pystratmacro = python3Packages.callPackage ./hd2pystratmacro { };
      poepyautopot = python3Packages.callPackage ./poepyautopot { };
      tilp2 = callPackage ./tilp2 { inherit gfm; };
    };
  };
}

# Manually update:
# nix run /home/lemon/Documents/GitHub/lemonake#packages.x86_64-linux.<package>
# Until I set up NVFetcher or something to automatically do this.
