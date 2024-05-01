{ pkgs }:
with pkgs; rec {
  legacy = callPackage ./legacy.nix {
    version = "1.1.30";
    hash = "sha256-4cXT3exhoMAK6gW3Cpx1L7cm9Xm0FK912gGcRyLYPwM=";
  };

  carbon = callPackage ./carbon.nix {
    version = "2.0.9";
    hash = "sha256-S46r/iZ92f7m+OMLVGq2WhH2Za4Pb32zpY3bVQ+ga3Q=";
  };

  carbon-unstable = carbon.override {
    version = "2.0.9";
    hash = "sha256-S46r/iZ92f7m+OMLVGq2WhH2Za4Pb32zpY3bVQ+ga3Q=";
  };
}
