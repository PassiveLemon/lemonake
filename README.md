# lemonake
This is my collection of packages and modules in a flake.

Some of these are already in Nixpkgs or in the process of getting merged but I provide faster updates here.

Packages and the flake are automatically updated every day and pushed to Cachix.

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

Documentation for certain modules and packages can be found in the docs subdirectory.

Modules:
- Home Manager (Do not use in NixOS configuration)
  - Can be imported with `inputs.lemonake.homeModules.<module>`
  - `programs.steamvr`
  - `wayland.windowManager.somewm`
- NixOS (Do not use in home-manager configuration)
  - Can be imported with `inputs.lemonake.nixosModules.<module>`
  - `services.autoadb`
  - `services.wivrn`
  - `programs.somewm`

Packages:
- Can be added with `inputs.lemonake.packages.${pkgs.system}.<package>`
- `alcom`
- `awmtt-git`
- `gdlauncher` (Alias to `gdlauncher-carbon`)
- `gdlauncher-carbon`
- `gdlauncher-legacy`
- `gfm`
- `gfm-git`
- `lua-pam-git`
- `monado-vulkan-layers-git`
- `nimpad`
- `nimpad-git`
- `opencomposite-git`
- `picom`
- `picom-tag`
- `picom-git`
- `proton-ge-rtsp` (Please only use with `programs.steam.extraCompatPackages`)
- `somewm`
- `somewm-git`
- `tilp2`
- `tilp2-git`
- `vapor-git`
- `wayvr-dashboard`
- `wayvr-dashboard-git`
- `webfisher`
- `webfisher-git`
- `wivrn`
- `wivrn-git`
- `wlx-overlay-s`
- `wlx-overlay-s-git`
- `xrizer`
- `xrizer-git`

Naming scheme:
- Latest release: `<package>`
- Latest tag: `<package>-tag`
- Latest commit: `<package>-git`

The only architecture currently supported is `x86_64-linux`. Others may be supported in the future.

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

## Other
Any sort of warning or assertion will be removed about 3 months after it was introduced to keep the code clean.

## Credits
- [moni-dz/nixpkgs-f2k](https://github.com/moni-dz/nixpkgs-f2k/) for inspiration
- [nix-community/nixpkgs-xr](https://github.com/nix-community/nixpkgs-xr/) for inspiration

