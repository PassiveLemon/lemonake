# WiVRn
[GitHub](https://github.com/Meumeu/WiVRn)

If you use Nvidia, it is recommended to install the `monado-vulkan-layers` (In this repo) package to mitigate crashes with OpenXR.
You can install it in `hardware.opengl.extraPackages`.

## Example usage
```nix
# configuration.nix
{
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
    config = {
      enable = true;
      json = {
        scale = 1.0;
        bitrate = 100000000;
        encoders = [
          {
            encoder = "nvenc";
            codec = "h264";
            width = 0.5;
            height = 1.0;
            offset_x = 0.0;
            offset_y = 0.0;
          }
          {
            encoder = "nvenc";
            codec = "h264";
            width = 0.5;
            height = 1.0;
            offset_x = 0.5;
            offset_y = 0.0;
          }
        ];
      };
    };
  };
}
```

## Full overview
```nix
# configuration.nix
{
  services.wivrn = {
    enable = { type = bool; default = true; };
    package = { type = package; default = pkgs.wivrn; };
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
    config = {
      enable = { type = bool; default = true; };
      json = { type = formats.json ; default = { }; };
    };
  };
}
```
