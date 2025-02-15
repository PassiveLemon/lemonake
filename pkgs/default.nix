{ self, inputs, ... }: {
  perSystem = { system, ... }:
  let
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ self.overlays.default ];
    };
  in
  {
    packages = self.overlays.default pkgs pkgs;
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

