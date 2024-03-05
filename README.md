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
- Can be imported with `inputs.lemonake.nixosModules.<module>`
- `alvr` (https://github.com/NixOS/nixpkgs/pull/284154)
  - ```
    programs.alvr = {
      enable = true;
      package = inputs.lemonake.packages.${pkgs.system}.alvr;     # Until ALVR gets merged.
      openFirewall = true;
    };
    ```

Packages: </br>
- Can be installed with `inputs.lemonake.packages.${pkgs.system}.<package>`
- `alvr` (For use with the module)
- `animdl` (Already in Nixpkgs)
- `gdlauncher` (Legacy)
- `gdlauncher-carbon`
- `gfm` (For use with TILP2)
- `hd2pystratmacro`
- `poepyautopot`
- `tilp2`
- `xclicker`

The only architecture currently supported is `x86_64-linux`. Others may be supported in the future. </br>

## Binary cache:
```nix
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
