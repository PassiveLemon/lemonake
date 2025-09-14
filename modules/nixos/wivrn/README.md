# WiVRn Module
[WiVRn GitHub](https://github.com/WiVRn/WiVRn)

[See important package information](../../../pkgs/wivrn/README.md)

When pairing a headset, the code should popup in your notifications, but if you don't have a notification daemon, you can also find the pairing code through the systemctl logs (`systemctl --user status wivrn`) or the dashboard.

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
> Note that the application option should be a list with package as the first element, but just using a package also works.

