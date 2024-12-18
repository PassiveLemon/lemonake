{ config, pkgs, lib, ... }:
let
  inherit (lib) mkIf mkEnableOption mkOption mkRenamedOptionModule literalExpression types maintainers;
  cfg = config.programs.steamvr;
  configFormat = pkgs.formats.json { };
  openvrRuntimeOverrideConfigFile = configFormat.generate "openvrpaths.vrpath" cfg.openvrRuntimeOverride.json;
  openxrRuntimeOverrideConfigFile = configFormat.generate "active_runtime.json" cfg.openxrRuntimeOverride.json;

  openvrRuntimePackage = (
    if cfg.helperScript.openvrRuntimePackage != ""
    then cfg.helperScript.openvrRuntimePackage
    else pkgs.opencomposite
  );
  openxrRuntimePackage = (
    if cfg.helperScript.openxrRuntimePackage != ""
    then cfg.helperScript.openxrRuntimePackage
    else if cfg.helperScript.openxrRuntime == "wivrn"
    then pkgs.wivrn
    else pkgs.monado
  );

  vrOverride = (
    if cfg.helperScript.openvrRuntime == "opencomposite"
    then "${openvrRuntimePackage}/lib/opencomposite"
    else ""
  );
  xrRuntimeJson = (
    if cfg.helperScript.openxrRuntime == "monado"
    then "${openxrRuntimePackage}/share/openxr/1/openxr_monado.json"
    else if cfg.helperScript.openxrRuntime == "wivrn"
    then "${openxrRuntimePackage}/share/openxr/1/openxr_wivrn.json"
    else ""
  );
  pressureVesselFilesystemsReadWrite = (
    if cfg.helperScript.openxrRuntime == "monado"
    then "$XDG_RUNTIME_DIR/monado_comp_ipc"
    else if cfg.helperScript.openxrRuntime == "wivrn"
    then "$XDG_RUNTIME_DIR/wivrn/comp_ipc"
    else ""
  );
  helperScriptE = pkgs.writeShellApplication {
    name = "oc-helper";
    text = ''
      export VR_OVERRIDE=${vrOverride}
      export XR_RUNTIME_JSON=${xrRuntimeJson}
      export PRESSURE_VESSEL_FILESYSTEMS_RW=${pressureVesselFilesystemsReadWrite}
      exec "$@"
    '';
  };
in
{
  options = {
    programs.steamvr = {
      openvrRuntimeOverride = {
        enable = mkEnableOption "a runtime override for SteamVR OpenVR";

        config = mkOption {
          type = types.enum [ "json" "text" ];
          description = "Set the configuration type for openvrRuntimeOverride.";
          default = "json";
        };

        # Remove on Dec 13 2024
        path = mkOption {
          type = types.str;
          description = "Deprecated configuration type.";
          default = "";
        };

        json = mkOption {
          type = configFormat.type;
          description = "Configuration for SteamVR OpenVR runtime. The attributes are serialized to JSON in `XDG_CONFIG_HOME/openxr/1/openvrpaths.vrpath`";
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
          example = literalExpression ''
            {
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
            }
          '';
        };

        text = mkOption {
          type = types.str;
          description = "Configuration for SteamVR OpenVR runtime. The text is placed in `XDG_CONFIG_HOME/openxr/1/openvrpaths.vrpath` verbatim.";
          default = literalExpression ''
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
          example = literalExpression ''
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
                "/path/to/opencomposite/build"
              ],
              "version": 1
            }
          '';
        };
      };

      openxrRuntimeOverride = {
        enable = mkEnableOption "a runtime override for SteamVR OpenXR";

        config = mkOption {
          type = types.enum [ "path" "json" "text" ];
          description = "Set the configuration type for openxrRuntimeOverride.";
          default = "json";
        };

        path = mkOption {
          type = types.path;
          description = "The active_runtime.json path to symlink to `XDG_CONFIG_HOME/openxr/1/active_runtime.json`";
          default = "";
          example = literalExpression "${pkgs.wivrn}/share/openxr/1/openxr_wivrn.json";
        };

        json = mkOption {
          type = configFormat.type;
          description = "Configuration for active OpenXR runtime. The attributes are serialized to JSON in `XDG_CONFIG_HOME/openxr/1/active_runtime.json`";
          default = {
            file_format_version = "1.0.0";
            runtime = {
              name = "SteamVR";
              VALVE_runtime_is_steamvr = true;
              library_path = "${config.home.homeDirectory}/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrclient.so";
            };
          };
          example = literalExpression ''
            {
              file_format_version = "1.0.0";
              runtime = {
                name = "Monado";
                # Note: WiVRn is not merged yet!
                library_path = "${pkgs.wivrn}/lib/wivrn/libopenxr_wivrn.so";
                MND_libmonado_path = "${pkgs.wivrn}/lib/wivrn/libmonado.so";
              };
            }
          '';
        };

        text = mkOption {
          type = types.str;
          description = "Configuration for active OpenXR runtime. The text is placed in `XDG_CONFIG_HOME/openxr/1/active_runtime.json` verbatim.";
          default = literalExpression ''
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
          example = literalExpression ''
            {
              "file_format_version": "1.0.0",
              "runtime": 
              {
                "name": "Monado",
                "library_path": "/path/to/runtime",
                "MND_libmonado_path": "/path/to/libmonado"
              }
            }
          '';
        };
      };

      helperScript = {
        enable = mkEnableOption "a helper script for setting SteamVR variables";
        openvrRuntime = mkOption {
          type = types.enum [ "opencomposite" ];
          description = "The OpenVR runtime to set for `VR_OVERRIDE`";
          default = "opencomposite";
        };
        openvrRuntimePackage = mkOption {
          type = types.package;
          description = "The path to the OpenVR runtime build. This is option is for overriding the openvrRuntime package.";
          default = "";
        };
        openxrRuntime = mkOption {
          type = types.enum [ "monado" "wivrn" ];
          description = "The OpenXR runtime to set for `XR_RUNTIME_JSON` and `PRESSURE_VESSEL_FILESYSTEMS_RW`";
          default = "monado";
        };
        openxrRuntimePackage = mkOption {
          type = types.package;
          description = "The path to the OpenXR runtime json. This is option is for overriding the openxrRuntime package.";
          default = "";
        };
      };
    };
  };

  imports = [
    # Remove on Dec 13 2024
    (mkRenamedOptionModule [ "services" "steamvr" ] [ "programs" "steamvr" ])
    (mkRenamedOptionModule [ "programs" "steamvr" "runtimeOverride" ] [ "programs" "steamvr" "openvrRuntimeOverride" ])
    (mkRenamedOptionModule [ "programs" "steamvr" "activeRuntimeOverride" ] [ "programs" "steamvr" "openxrRuntimeOverride" ])
  ];

  config = {
    # Remove on Dec 13 2024
    assertions = [
      {
        assertion = (config.programs.steamvr.openvrRuntimeOverride.path == "");
        message = "The programs.steamvr.openvrRuntimeOverride.path configuration type has been removed. Consider the json configuration instead.";
      }
    ];
    
    xdg.configFile = {
      "openvr/openvrpaths.vrpath" = mkIf cfg.openvrRuntimeOverride.enable {
        source = mkIf (cfg.openvrRuntimeOverride.config == "json") openvrRuntimeOverrideConfigFile;
        text = mkIf (cfg.openvrRuntimeOverride.config == "text") cfg.openvrRuntimeOverride.text;
      };
      "openxr/1/active_runtime.json" = mkIf cfg.openxrRuntimeOverride.enable {
        source = (
          if cfg.openxrRuntimeOverride.config == "path"
          then cfg.openxrRuntimeOverride.path
          else openxrRuntimeOverrideConfigFile
        );
        text = mkIf (cfg.openxrRuntimeOverride.config == "text") cfg.openxrRuntimeOverride.text;
      };
    };

    home.packages = mkIf cfg.helperScript.enable [
      helperScriptE
    ];
  };
  meta.maintainers = with maintainers; [ passivelemon ];
}

