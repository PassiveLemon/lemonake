{ lib, ... }:
let
  inherit (lib) packager;
in
{
  flake.overlays = {
    lua-pam = final: prev: {
      lua-pam-git = packager "lua-pam-git" ./package.nix prev { };

      lua-pam-luajit-git = final.lua-pam-git.override { lua = prev.luajit; };
    };
  };
}

