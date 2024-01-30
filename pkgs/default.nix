{ pkgs ? import <nixpkgs> { } }: 

with pkgs; rec {
  alvr = callPackage ./alvr { };
  animdl = python3Packages.callPackage ./animdl { };
  gdlauncher = callPackage ./gdlauncer { };
  gdlauncher-carbon = callPackage ./gdlauncher-carbon { };
  gfm = callPackage ./gfm { };
  poepyautopot = python3Packages.callPackage ./poepyautopot { };
  pulsemeeter = python3Packages.callPackage ./pulsemeeter { };
  tilp2 = callPackage ./tilp2 { gfm };
  xclicker = callPackage ./xclicker { };
}
