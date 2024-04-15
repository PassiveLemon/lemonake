# WiVRn
[GitHub](https://github.com/Meumeu/WiVRn)

If you use Nvidia, it is recommended to install the `monado-vulkan-layers` (In this repo) package to mitigate crashes with OpenXR.
You can install it in `hardware.opengl.extraPackages`.

## Example usage
```nix
services.wivrn = {
  enable = true;
  package = inputs.lemonake.packages.${pkgs.system}.wivrn; # Until WiVRn gets merged.
  openFirewall = true;
  highPriority = true;
  defaultRuntime = true;
  monadoEnvironment = {
    XRT_COMPOSITOR_LOG = "debug";
    XRT_PRINT_OPTIONS = "on";
    IPC_EXIT_ON_DISCONNECT = "off";
  };
};
```

## Full overview
```nix
services.wivrn = {
  enable = { type = bool; default = true; };
  package = {
    type = package;
    default = pkgs.wivrn;
  };
  openFirewall = { type = bool; default = false; };
  highPriority = { type = bool; default = true; };
  defaultRuntime = { type = bool; default = true; };
  monadoEnvironment = {
    type = types.attrsOf types.str;
    default = {
      XRT_COMPOSITOR_LOG = "debug";
      XRT_PRINT_OPTIONS = "on";
      IPC_EXIT_ON_DISCONNECT = "off";
    };
  };
};
```
