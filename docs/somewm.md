# SomeWM
[SomeWM GitHub](https://github.com/trip-zip/somewm)

This repository features two modules for managing SomeWM, a NixOS module that enables UWSM and adds the SomeWM entry, and a home-manager module (Incomplete) that sets up systemd services if UWSM is not enabled.

By default, SomeWM will check for your AwesomeWM config at `~/.config/awesome` if it doesn't find one at `~/.config/somewm`. This means that all you need to do is expose any extra libraries to the SomeWM package and it should work nearly flawlessly, but do note the [deviations](https://github.com/trip-zip/somewm/blob/main/DEVIATIONS.md) as they may cause issues.

> [!NOTE]
> SomeWM uses LuaJIT by default, there may be unexpected conflicts when using libraries built on non-JIT Lua.

To expose extra lua libraries from nixpkgs, you can add them to `wayland.windowManager.somewm.extraLuaModules`
```nix
# home.nix
{
  wayland.windowManager.somewm = {
    enable = true;
    package = inputs.lemonake.packages.${pkgs.system}.somewm;
    extraLuaModules = with pkgs.luajitPackages [ luafilesystem ];
  };
}
```

For custom libraries and/or shared objects, you can add those to extraSearchPaths. The structure is the exact same as `extraLuaModules`.

For custom GI type library paths, you can add those to extraGITypeLibPaths. This is only possible through a package override so a module option does not exist:
```nix
# home.nix
{
  wayland.windowManager.somewm = {
    enable = true;
    package = (inputs.lemonake.packages.${pkgs.system}.somewm.override {
      extraGITypeLibPaths = with pkgs.luajitPackages; [
        networkmanager upower playerctl # These are already packaged with SomeWM
      ];
    };
  };
}
```

