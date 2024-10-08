{ self, inputs, ... }: {
  perSystem = { system, pkgs, ... }:
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
}

