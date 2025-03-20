# WiVRn Package
[WiVRn GitHub](https://github.com/Meumeu/WiVRn)

When using the package from this repository, in order to compile WiVRn with Nvenc support, you must override the cudaSupport value like so: `inputs.lemonake.packages.${pkgs.system}.wivrn.override { cudaSupport = true; }`. This value is not inherited from your NixOS configuration.

If you are using an Nvidia driver older than 565.77.01, you should install the `monado-vulkan-layers` package to mitigate crashes with OpenXR. Add it to `hardware.opengl.extraPackages`.

