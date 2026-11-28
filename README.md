# lemonake
My collection of packages and modules in a flake. This is mostly just for myself so I don't have to wait for the whole Nixpkgs review process which can take days.

The inputs are updated every day. Each package is built and pushed to Cachix if redistributable.

## Usage
Add the flake to your inputs:
```nix
# flake.nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    lemonake.url = "github:passivelemon/lemonake";
  };

  outputs = { ... } @ inputs: {
    # ...
  };
}
```

## Features
Run `nix flake show github:passivelemon/lemonake` to see all outputs. Home Manager modules will show as unknown.

The only architecture currently supported is `x86_64-linux`. Others may be supported in the future.

Documentation for certain modules and packages can be found in the docs subdirectory.

Modules:
- NixOS (`inputs.lemonake.nixosModules.<module>`)
  - AutoADB (`services.autoadb`)

Packages (`inputs.lemonake.packages.<system>.<package>`):
- `autoadb`
- `awesome-git`
- `awesome-luajit-git`
- `lite-xl-git`
- `lua-pam-git`
- `lua-pam-luajit-git`
- `nimpad`
- `outsource`
- `somewm` (`-git`)
- `tilp2-git`
- `webfisher`

Source types:
  - Release: No suffix, only the latest stable release
  - Tag: `-tag` suffix, may include pre-releases
  - Git: `-git` suffix, the latest commit

If a package has multiple sources, the other suffixes will be in parenthesis.
Git source packages often fail to build due to outdated packaging so they may not get cached until fixed.

## Binary cache
```nix
# configuration.nix
{
  nix.settings = {
    extra-substituters = [ "https://passivelemon.cachix.org" ];
    extra-trusted-public-keys = [ "passivelemon.cachix.org-1:ScYjLCvvLi70S95SMMr8lMilpZHuafLP3CK/nZ9AaXM=" ];
  };
}
```

## Credits
- [moni-dz/nixpkgs-f2k](https://github.com/moni-dz/nixpkgs-f2k/) for inspiration
- [nix-community/nixpkgs-xr](https://github.com/nix-community/nixpkgs-xr/) for inspiration

