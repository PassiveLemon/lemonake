# SteamVR
Custom module to allow you to override the SteamVR `openvrpaths.vrpath` runtime and system OpenXR `active_runtime.json`

## Example usage
```nix
services.steamvr = {
  runtimeOverride = {
    enable = true;
    path = "${pkgs.opencomposite}/lib/opencomposite";
  };
  activeRuntimeOverride = {
    enable = true;
    path = "${pkgs.wivrn}/share/openxr/1/openxr_wivrn.json"; # WiVRn is not merged yet
  };
};
```

## Full overview
```nix
services.steamvr = {
  runtimeOverride = {
    enable = { type = bool; default = true; };
    path = {
      type = path;
      default = "${config.home.homeDirectory}/.local/share/Steam/steamapps/common/SteamVR";
    };
  };
  activeRuntimeOverride = {
    enable = { type = bool; default = true; };
    path = {
      type = path;
      default = "";
    };
  };
};
```
