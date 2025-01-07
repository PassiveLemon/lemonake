# SteamVR
Custom module to allow you to override the SteamVR OpenVR and OpenXR runtime.

Use the helper `vr-helper` to launch Steam games with the proper variables set: `vr-helper %command%`.

Currently, the default runtimes for OpenXR and OpenVR are Monado and OpenComposite respectively, however There is also WiVRn for OpenXR and xrizer for OpenVR.

>[!NOTE]
> Tildes (`~`) get expanded to your home path. For example, `~/.local/share/` will literally get evaluated to `/home/(user)/.local/share/`

## Example usage
```nix
# home.nix
{
  programs.steamvr = {
    openvrRuntimeOverride = {
      enable = true;
      config = "json";
      # Note: Path is not used if config is set to json, this is just for an example.
      path = "${pkgs.opencomposite}/lib/opencomposite";
      json = {
        config = [
          "${config.home.homeDirectory}/.local/share/Steam/config"
        ];
        external_drivers = [ ];
        jsonid = "vrpathreg";
        log = [
          "${config.home.homeDirectory}/.local/share/Steam/logs"
        ];
        runtime = [
          "${pkgs.opencomposite}/lib/opencomposite"
        ];
        version = 1;
      };
    };
    openxrRuntimeOverride = {
      enable = true;
      config = "json";
      # Note: Path is not used if config is set to json, this is just for an example.
      path = "${pkgs.wivrn}/share/openxr/1/openxr_wivrn.json";
      json = {
        file_format_version = "1.0.0";
        runtime = {
          name = "Monado";
          library_path = "${pkgs.wivrn}/lib/wivrn/libopenxr_wivrn.so";
          MND_libmonado_path = "${pkgs.wivrn}/lib/wivrn/libmonado.so";
        };
      };
    };
    helperScript = {
      enable = true;
      openvrRuntime = "opencomposite";
      openxrRuntime = "wivrn";
    };
  };
}
```

