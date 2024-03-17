# lemonake </br>

This is my collection of packages and modules in a flake. </br>

## Usage </br>
Add the flake to your inputs: </br>
```nix
# flake.nix
{
  lemonake.url = "github:passivelemon/lemonake";

  outputs = { self, ... } @ inputs: {
    ...
  };
}
```

## Features </br>
Modules: </br>
- NixOS (Do not use in home-manager configuration)
  - Can be imported with `inputs.lemonake.nixosModules.<module>`
  - [`alvr`](./modules/nixos/alvr/README.md) (In Nixpkgs)
  - [`wivrn`](./modules/nixos/wivrn/README.md) (https://github.com/NixOS/nixpkgs/pull/293058)
- Home Manager (Do not use in nixos configuration)
  - Can be imported with `inputs.lemonake.homeManagerModules.<module>`
  - [`steamvr`](./modules/home-manager/steamvr/README.md)

Packages: </br>
- Can be added with `inputs.lemonake.packages.${pkgs.system}.<package>`
- `alvr` (In Nixpkgs)
- `animdl` (In Nixpkgs)
- `gdlauncher` (Legacy)
- `gdlauncher-carbon`
- `gfm` (For use with TILP2)
- `hd2pystratmacro`
- `poepyautopot`
- `tilp2`
- `wivrn` (https://github.com/NixOS/nixpkgs/pull/293058)

Run `nix flake show github:passivelemon/lemonake` to see all outputs.

The only architecture currently supported is `x86_64-linux`. Others may be supported in the future. </br>

## Binary cache:
```nix
# flake.nix
{
  outputs = { self, ... } @ inputs: {
    ...

    nixConfig = {
      extra-substituters = [ "https://passivelemon.cachix.org" ];
      extra-trusted-public-keys = [ "passivelemon.cachix.org-1:ScYjLCvvLi70S95SMMr8lMilpZHuafLP3CK/nZ9AaXM=" ];
    };
  };
}
```
