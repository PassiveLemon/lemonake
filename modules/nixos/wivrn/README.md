# WiVRn
[GitHub](https://github.com/Meumeu/WiVRn)

In order to compile WiVRn with Nvenc, you must override the cudaSupport value like so: `inputs.lemonake.packages.${pkgs.system}.wivrn-git.override { cudaSupport = true; }`. This value is not inherited from your NixOS configuration.

> ![NOTE]
> If you are using an Nvidia driver older than 565.77.01, you should install the `monado-vulkan-layers` package to mitigate crashes with OpenXR. Add it to `hardware.opengl.extraPackages`.

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
    extraServerFlags = [ "--no-publish-service" ]
    config = {
      enable = true;
      json = {
        scale = 0.5;
        bitrate = 100000000;
        encoders = [
          {
            encoder = "nvenc";
            codec = "h264";
            width = 1.0;
            height = 1.0;
            offset_x = 0.0;
            offset_y = 0.0;
          }
        ];
        # Different application examples:
        application = pkgs.wlx-overlay-s;
        application = [ pkgs.wlx-overlay-s ];
        application = [ pkgs.wlx-overlay-s "--openxr" ];
      };
    };
  };
}
```
> [!NOTE]
> Note that the application option must be either a package or a list with package as the first element.

