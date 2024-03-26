{ pkgs }:
with pkgs; rec {
  legacy = callPackage ./legacy.nix {
    version = "1.1.30";
    hash = "sha256-4cXT3exhoMAK6gW3Cpx1L7cm9Xm0FK912gGcRyLYPwM=";
  };

  carbon = callPackage ./carbon.nix {
    version = "2.0.2";
    hash = "sha256-mPvQK+4s0BxR8yi0Fu6HMtWuH7bKj4jvTBFVa+cbZs8=";
  };

  stable = carbon;

  carbon-unstable = carbon.override {
    version = "2.0.2";
    hash = "sha256-mPvQK+4s0BxR8yi0Fu6HMtWuH7bKj4jvTBFVa+cbZs8=";
  };

  unstable = carbon-unstable;
}
