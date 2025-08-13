# WiVRn Package
[WiVRn GitHub](https://github.com/Meumeu/WiVRn)

When using the package from this repository, in order to compile WiVRn with Nvenc support, you must override the cudaSupport value like so: `inputs.lemonake.packages.${pkgs.system}.wivrn.override { cudaSupport = true; }`. This value is not inherited from your NixOS configuration.

By default, WiVRn will search for OpenComposite and XRizer (in that order) for OpenVR compatibility. Due to the Nix packaging, OpenComposite will always be selected. If you would like to change this, override the `ovrCompatSearchPaths` value like so: `inputs.lemonake.packages.${pkgs.system}.wivrn.override { ovrCompatSearchPaths = "${pkgs.xrizer}/lib/xrizer"; }`. This value MUST be a string.

If you are using an Nvidia driver older than 565.77.01, you should install the `monado-vulkan-layers` package to mitigate crashes with OpenXR. Add it to `hardware.opengl.extraPackages`.

