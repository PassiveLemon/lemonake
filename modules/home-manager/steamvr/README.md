# SteamVR
Custom module to allow you to override the SteamVR `openvrpaths.vrpath` runtime and user OpenXR `active_runtime.json`

## Example usage
```nix
# home.nix
{
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
}
```

## Full overview
```nix
# home.nix
{
  services.steamvr = {
    runtimeOverride = {
      enable = { type = bool; default = false; };
      path = {
        type = path;
        default = "${config.home.homeDirectory}/.local/share/Steam/steamapps/common/SteamVR";
      };
    };
    activeRuntimeOverride = {
      enable = { type = bool; default = false; };
      path = { type = path; default = ""; };
    };
  };
}
```
