# WiVRn Package
[WiVRn GitHub](https://github.com/WiVRn/WiVRn)

[See important module information](../../modules/nixos/wivrn/README.md)

When using the package from this repository, in order to compile WiVRn with Nvenc support, you must override the cudaSupport value like so: `inputs.lemonake.packages.${pkgs.system}.wivrn.override { cudaSupport = true; }`. This value is not inherited from your NixOS configuration.

By default, WiVRn will search for XRizer and OpenComposite (in that order) for OpenVR compatibility. Due to the Nix packaging, XRizer will always be selected. If you would like to change this, set the "openvr-compat-path" config option in the modue json. Example: `services.wivrn.config.json.openvr-compat-path = "${pkgs.opencomposite}/lib/opencomposite";`. This value MUST be a string.
- Alternatively, if you are not using the module for some reason, you can override the package itself: `inputs.lemonake.packages.${pkgs.system}.wivrn.override { ovrCompatSearchPaths = "${pkgs.opencomposite}/lib/opencomposite"; }`

> [!IMPORTANT]
> If you are using an Nvidia driver older than 565.77.01, you should install the `monado-vulkan-layers` package to mitigate crashes with OpenXR. Add it to `hardware.opengl.extraPackages`.

