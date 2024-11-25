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
    ./alvr
    ./animdl
    ./gdlauncher
    ./gfm
    ./hd2pystratmacro
    ./monado-vulkan-layers
    ./opencomposite
    ./picom
    ./poepyautopot
    ./tilp2
    ./wivrn
  ];

  flake.overlays = {
    default = self.overlays.linux;

    linux = final: prev: with self.overlays;
      (adgobye final prev)
      // (alcom final prev)
      # Remove on Feb 24 2025
      // (alvr final prev)
      // (animdl final prev)
      // (gdlauncher final prev)
      // (gfm final prev)
      // (hd2pystratmacro final prev)
      // (monado-vulkan-layers final prev)
      // (opencomposite final prev)
      // (picom final prev)
      // (poepyautopot final prev)
      // (tilp2 final prev)
      // (wivrn final prev);
  };
}

