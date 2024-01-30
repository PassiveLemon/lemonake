# lemonake </br>

This is my collection of packages and modules in a flake. </br>

## Usage </br>
Add the flake to your inputs: </br>
```
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
- Can be imported with `inputs.lemonake.nixosModules.<module>`
- ALVR (https://github.com/NixOS/nixpkgs/pull/284154)

Packages: </br>
- Can be installed with `inputs.lemonake.packages.${pkgs.system}.<package>`
- ALVR (For use with the module)
- Animdl (Already in Nixpkgs)
- GDLauncher (Legacy)
- GDLauncher-Carbon
- GFM (For use with TILP2)
- PoEPyAutopot
- TILP2
- XClicker

The only architecture currently supported is `x86_64-linux`. Others may be supported in the future. </br>

## Binary cache:
```
# flake.nix
{
  outputs = {
    ...

    nixConfig = {
      extra-substituters = [ "https://passivelemon.cachix.org" ];
      extra-trusted-public-keys = [ "passivelemon.cachix.org-1:ScYjLCvvLi70S95SMMr8lMilpZHuafLP3CK/nZ9AaXM=" ];
    };
  };
}
```
