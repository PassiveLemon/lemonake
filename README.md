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
  - [`programs.alvr`](./modules/nixos/alvr/README.md)
  - [`services.autoadb`](./modules/nixos/autoadb/README.md)
  - [`services.wivrn`](./modules/nixos/wivrn/README.md)
- Home Manager (Do not use in NixOS configuration)
  - Can be imported with `inputs.lemonake.homeManagerModules.<module>`
  - [`programs.steamvr`](./modules/home-manager/steamvr/README.md)

Packages:
- Can be added with `inputs.lemonake.packages.${pkgs.system}.<package>`
- `adgobye`
- `adgobye-git`
- `alcom`
- `alvr`
- `alvr-git`
- `animdl-git`
- `gdlauncher` (`gdlauncher-carbon`)
- `gdlauncher-carbon`
- `gdlauncher-legacy`
- `gfm`
- `gfm-git`
- `hd2pystratmacro`
- `hd2pystratmacro-git`
- `monado-vulkan-layers-git`
- `opencomposite-git`
- `picom`
- `picom-tag`
- `picom-git`
- `poepyautopot`
- `poepyautopot-git`
- `tilp2`
- `tilp2-git`
- `wivrn`
- `wivrn-git`

Naming scheme:
- Latest release: `package`
- Latest tag: `package-tag`
- Latest commit: `package-git`

If it has a ... in parenthesis:
- PR: It is in an open pull request.
- Package: It is an alias to that package.

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
Any sort of warning or assertion will be removed exactly 3 months after it was introduced to keep the code clean.

## Credits
- [moni-dz/nixpkgs-f2k](https://github.com/moni-dz/nixpkgs-f2k/) for inspiration
- [nix-community/nixpkgs-xr](https://github.com/nix-community/nixpkgs-xr/) for inspiration

