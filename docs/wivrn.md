# WiVRn
[WiVRn GitHub](https://github.com/WiVRn/WiVRn)

When using the package from this repository, in order to compile WiVRn with Nvenc support, you must override the cudaSupport value like so: `inputs.lemonake.packages.${pkgs.system}.wivrn.override { cudaSupport = true; }`. This value is not inherited from your NixOS configuration.

By default, WiVRn will search for XRizer and OpenComposite (in that order) for OpenVR compatibility. Due to the Nix packaging, XRizer will always be selected. If you would like to change this, set the "openvr-compat-path" config option in the modue json. Example: `services.wivrn.config.json.openvr-compat-path = "${pkgs.opencomposite}/lib/opencomposite";`. This value MUST be a string.
- Alternatively, if you are not using the module for some reason, you can override the package itself: `inputs.lemonake.packages.${pkgs.system}.wivrn.override { ovrCompatSearchPaths = "${pkgs.opencomposite}/lib/opencomposite"; }`

> [!IMPORTANT]
> If you are using an Nvidia driver older than 565.77.01, you should install the `monado-vulkan-layers` package to mitigate crashes with OpenXR. Add it to `hardware.opengl.extraPackages`.

When pairing a headset, the code should popup in your notifications, but if you don't have a notification daemon, you can also find the pairing code through the systemctl logs (`systemctl --user status wivrn`) or the dashboard.

You can find official configuration information [here](https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)

## Example usage
```nix
# configuration.nix
{
  services.wivrn = {
    enable = true;
    package = pkgs.wivrn;
    openFirewall = true;
    highPriority = true;
    defaultRuntime = true;
    monadoEnvironment = {
      XRT_COMPOSITOR_LOG = "warning";
    };
    extraServerFlags = [ "--no-encrypt" ];
    config = {
      enable = true;
      json = {
        application = [ pkgs.wlx-overlay-s "--openxr" ];
        bitrate = 100000000;
        encoders = [{
          encoder = "nvenc";
          codec = "h264";
          width = 1.0;
          height = 1.0;
          offset_x = 0.0;
          offset_y = 0.0;
        }];
      };
    };
  };
}
```
> [!NOTE]
> Note that the application option should be a list with a package as the first element, but just using a package also works.

