# lemonake
This is my collection of packages and modules in a flake.

Some of these are already in Nixpkgs or in the process of getting merged but I provide faster updates here.

Packages and the flake are automatically updated every day and pushed to Cachix.

## Usage
Add the flake to your inputs:
```nix
# flake.nix
{
  lemonake.url = "github:passivelemon/lemonake";

  outputs = { self, ... } @ inputs: {
    ...
  };
}
```

## Features
Run `nix flake show github:passivelemon/lemonake` to see all outputs.
- Note: Home Manager modules will show as unknown.

Modules:
- NixOS (Do not use in home-manager configuration)
  - Can be imported with `inputs.lemonake.nixosModules.<module>`
  - [`alvr`](./modules/nixos/alvr/README.md) (24.05)
  - [`autoadb`](./modules/nixos/autoadb/README.md)
  - [`wivrn`](./modules/nixos/wivrn/README.md) (https://github.com/NixOS/nixpkgs/pull/316975)
- Home Manager (Do not use in NixOS configuration)
  - Can be imported with `inputs.lemonake.homeManagerModules.<module>`
  - [`steamvr`](./modules/home-manager/steamvr/README.md)

Packages:
- Can be added with `inputs.lemonake.packages.${pkgs.system}.<package>`
- `alvr` (24.05)
- `animdl-git` (24.05)
- `gdlauncher` (`gdlauncher-carbon`)
- `gdlauncher-carbon`
- `gdlauncher-legacy`
- `gfm`
- `gfm-git`
- `hd2pystratmacro`
- `hd2pystratmacro-git`
- `monado-vulkan-layers-git`
- `poepyautopot`
- `poepyautopot-git`
- `tilp2`
- `tilp2-git`
- `wivrn` (https://github.com/NixOS/nixpkgs/pull/316975)
- `wivrn-git`

If it has a ... in parenthesis:
- NixOS version: It was merged in that release.
- PR: It is in an open pull request.
- Package: It is an alias to that package.

The only architecture currently supported is `x86_64-linux`. Others may be supported in the future.

## Binary cache
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

## Other
Any sort of warning or assertion will be removed exactly 3 months after it was introduced to keep the code clean.

## Credits
- [moni-dz/nixpkgs-f2k](https://github.com/moni-dz/nixpkgs-f2k/) for inspiration

