{ self, inputs, ... }: {
  perSystem = { system, ... }:
  let
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ self.overlays.default ];
    };
    lib = pkgs.lib;

    flakePkgs = self.packages.${system};

    testLicense = license:
      license ? redistributable &&
      license.redistributable;

    isRedistributable = pkg:
      pkg.meta ? license &&
      (if lib.isList pkg.meta.license
      then lib.all testLicense pkg.meta.license
      else testLicense pkg.meta.license);

    redistributablePkgs = builtins.attrNames (lib.filterAttrs (_: pkg: isRedistributable pkg) flakePkgs);
    nonRedistributablePkgs = builtins.attrNames (lib.filterAttrs (_: pkg: ! isRedistributable pkg) flakePkgs);
  in
  {
    packages = self.overlays.default pkgs pkgs;
    redistributablePackages = redistributablePkgs;
    nonRedistributablePackages = nonRedistributablePkgs;
  };

  _module.args.getPackage = pname: pkgs: (pkgs.callPackage ../_sources/generated.nix { }).${pname};

  imports = [
    ./adgobye
    ./alcom
    ./animdl
    ./autoadb
    ./gdlauncher
    ./gfm
    ./hd2pystratmacro
    ./lua-pam
    ./monado-vulkan-layers
    ./opencomposite
    ./picom
    ./poepyautopot
    ./proton-ge-rtsp
    ./tilp2
    ./vapor
    ./wayvr-dashboard
    ./webfisher
    ./wivrn
    ./wlx-overlay-s
    ./xrizer
  ];

  flake.overlays = {
    default = self.overlays.linux;

    linux = final: prev: with self.overlays;
      (adgobye final prev)
      // (alcom final prev)
      // (animdl final prev)
      // (autoadb final prev)
      // (gdlauncher final prev)
      // (gfm final prev)
      // (hd2pystratmacro final prev)
      // (lua-pam final prev)
      // (monado-vulkan-layers final prev)
      // (opencomposite final prev)
      // (picom final prev)
      // (poepyautopot final prev)
      // (proton-ge-rtsp final prev)
      // (tilp2 final prev)
      // (vapor final prev)
      // (wayvr-dashboard final prev)
      // (webfisher final prev)
      // (wivrn final prev)
      // (wlx-overlay-s final prev)
      // (xrizer final prev);
  };
}

