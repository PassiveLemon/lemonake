# SteamVR
Custom module to allow you to override the SteamVR OpenVR and OpenXR runtime. Only one configuration format can be used for each: json, text, or path.

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
  };
}
```

## Full overview
```nix
# home.nix
{
  programs.steamvr = {
    openvrRuntimeOverride = {
      enable = { type = bool; default = false; };
      config = { type = enum [ "json" "text" ]; default = "json"; };
      json = {
        type = formats.json;
        default = {
          config = [
            "${config.home.homeDirectory}/.local/share/Steam/config"
          ];
          external_drivers = [ ];
          jsonid = "vrpathreg";
          log = [
            "${config.home.homeDirectory}/.local/share/Steam/logs"
          ];
          runtime = [
            "${config.home.homeDirectory}/.local/share/Steam/steamapps/common/SteamVR"
          ];
          version = 1;
        };
      };
      text = {
        type = str;
        default = ''
          {
            "config": [
              "~/.local/share/Steam/config"
            ],
            "external_drivers": [ ],
            "jsonid": "vrpathreg",
            "log": [
              "~/.local/share/Steam/logs"
            ],
            "runtime": [
              "~/.local/share/Steam/steamapps/common/SteamVR"
            ],
            "version": 1
          }
        '';
      };
    };
    openxrRuntimeOverride = {
      enable = { type = bool; default = false; };
      config = { type = enum [ "path" "json" "text" ]; default = "json"; };
      path = { type = path; default = ""; };
      json = {
        type = formats.json;
        default = {
          file_format_version = "1.0.0";
          runtime = {
            name = "SteamVR";
            VALVE_runtime_is_steamvr = true;
            library_path = "${config.home.homeDirectory}/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrclient.so";
          };
        };
      text = {
        type = str;
        default = ''
          {
            "file_format_version": "1.0.0",
            "runtime":
            {
              "name": "SteamVR",
              "VALVE_runtime_is_steamvr": true,
              "library_path": "~/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrclient.so",
            }
          }
        '';
      };
    };
  };
}
```

