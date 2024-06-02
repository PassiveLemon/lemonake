{ pkgs }:
with pkgs; rec {
  legacy = callPackage ./legacy.nix {
    version = "1.1.30";
    hash = "sha256-4cXT3exhoMAK6gW3Cpx1L7cm9Xm0FK912gGcRyLYPwM=";
  };

  carbon = callPackage ./carbon.nix {
    version = "2.0.14";
    hash = "sha256-lDpCgF71b3Ec54IGzVbT9nCyXhP9goLew1KCzCXEYHc=";
  };

  carbon-unstable = carbon.override {
    version = "2.0.14";
    hash = "sha256-lDpCgF71b3Ec54IGzVbT9nCyXhP9goLew1KCzCXEYHc=";
  };
}
