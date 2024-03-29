{ pkgs }:
with pkgs; rec {
  legacy = callPackage ./legacy.nix {
    version = "1.1.30";
    hash = "sha256-4cXT3exhoMAK6gW3Cpx1L7cm9Xm0FK912gGcRyLYPwM=";
  };

  carbon = callPackage ./carbon.nix {
    version = "2.0.4";
    hash = "sha256-qzRWoeWNL/aY9AN/LvPqy37RjkTaPnHsvm1Lm7L44H0=";
  };

  stable = carbon;

  carbon-unstable = carbon.override {
    version = "2.0.4";
    hash = "sha256-qzRWoeWNL/aY9AN/LvPqy37RjkTaPnHsvm1Lm7L44H0=";
  };

  unstable = carbon-unstable;
}
