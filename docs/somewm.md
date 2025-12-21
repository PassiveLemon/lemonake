# SomeWM
[SomeWM GitHub](https://github.com/trip-zip/somewm)

This repository features two modules for managing SomeWM, a NixOS module that enables UWSM and adds the SomeWM entry, and a home-manager module that sets up systemd services if UWSM is not enabled (home-manager module is currently not complete).

By default, SomeWM will check for your AwesomeWM config at `~/.config/awesome` if it doesn't find one at `~/.config/somewm`. This means that all you need to do is expose any extra libraries to the SomeWM package and it should work nearly flawlessly. If you aren't using the modules in this repository, you can simply append a `--search <path-to-lib>` for each extra library. If you are using the modules in this repository however, you need to override the package to search them. The examples below are shown for the home-manager module but the same package option exists for the NixOS module.

To expose extra lua libraries from nixpkgs, you can override the package and add them to extraLuaModules:
```nix
# home.nix
{
  wayland.windowManager.somewm = {
    enable = true;
    package = (inputs.lemonake.packages.${pkgs.system}.somewm-git.override {
      extraLuaModules = with pkgs.luajitPackages; [
        luafilesystem
      ];
    };
  };
}
```

For custom libraries and/or shared objects, you can add those to extraSearchPaths in the same way:
```nix
# home.nix
{
  wayland.windowManager.somewm = {
    enable = true;
    package = (inputs.lemonake.packages.${pkgs.system}.somewm-git.override {
      extraSearchPaths = [
        inputs.lemonake.packages.${pkgs.system}.lua-pam-luajit-git
      ];
    };
  };
}
```

