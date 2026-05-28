{ config, pkgs, lib, ... }:
let
  inherit (lib) mkIf mkEnableOption mkPackageOption mkOption types maintainers concatMapStrings concatStringsSep;
  cfg = config.wayland.windowManager.somewm;

  # variables = concatStringsSep " " cfg.systemd.variables;
  # extraCommands = concatStringsSep " " (map (f: "&& ${f}") cfg.systemd.extraCommands);
  # systemdActivation = "${pkgs.dbus}/bin/dbus-update-activation-environment --systemd ${variables} ${extraCommands}";
  
  getLuaPath = lib: dir: "${lib}/${dir}/lua/${cfg.lua.luaversion}";
  makeSearchPaths = concatMapStrings (
    path: "--search ${getLuaPath path "share"}" + "--search ${getLuaPath path "lib"}"
  );
  finalSearchPaths = makeSearchPaths ([ cfg.extraLuaModules ] ++ cfg.extraSearchPaths);
in
{
  options = {
    wayland.windowManager.somewm = {
      enable = mkEnableOption "somewm";

      package = mkPackageOption pkgs "somewm" { };

      lua = mkPackageOption pkgs "luajit" { };

      systemd = {
        # TODO: Finish. References: https://github.com/nix-community/home-manager/blob/release-25.11/modules/services/window-managers/river.nix
        enable = mkEnableOption null // {
          default = true;
          description = ''
            Whether to enable {file}`somewm-session.target` on
            somewm startup. This links to {file}`graphical-session.target`}.
            Some important environment variables will be imported to systemd
            and D-Bus user environment before reaching the target, including
            - `DISPLAY`
            - `WAYLAND_DISPLAY`
            - `XDG_CURRENT_DESKTOP`
          '';
        };

        useService = mkOption {
          default = false;
          type = types.bool;
          description = "use a systemd service rather than a target.";
        };
        
        variables = mkOption {
          type = types.listOf types.str;
          default = [
            "DISPLAY"
            "WAYLAND_DISPLAY"
            "XDG_CURRENT_DESKTOP"
          ];
          example = [ "-all" ];
          description = "Environment variables to be imported in the systemd & D-Bus user environment.";
        };

        extraCommands = mkOption {
          type = types.listOf types.str;
          default = [
            "systemctl --user stop somewm-session.target"
            "systemctl --user start somewm-session.target"
          ];
          description = "Extra commands to be run after D-Bus activation.";
        };
      };

      extraLuaModules = mkOption {
        type = types.listOf types.package;
        description = "Extra Lua modules to add to the SomeWM search path";
        default = [ ];
      };

      extraSearchPaths = mkOption {
        type = types.listOf types.package;
        description = "Other extra search paths to add to SomeWM";
        default = [ ];
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [
      cfg.package
    ];

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        gnome-keyring
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };

    systemd.user.targets.somewm-session = lib.mkIf cfg.systemd.enable {
      Unit = {
        Description = "SomeWM compositor session";
        Documentation = [ "man:systemd.special(7)" ];
        BindsTo = [ "graphical-session.target" ];
        Wants = [ "graphical-session-pre.target" ];
        After = [ "graphical-session-pre.target" ];
      };
    };

    systemd.user.services.somewm = lib.mkIf cfg.systemd.useService {
      Unit = {
        Description = "SomeWM Wayland compositor";
        BindsTo = [ "graphical-session.target" ];
        Wants = [ "graphical-session-pre.target" ];
        After = [ "graphical-session-pre.target" ];
        X-SwitchMethod = "reload";
      };
      Service = {
        Slice = [ "session.slice" ];
        Type = "notify";
        ExecStart = "${cfg.package}/bin/somewm ${finalSearchPaths}";
        ExecReload = "${cfg.package}/bin/somewm-client reload";
      };
    };
  };
  meta.maintainers = with maintainers; [ passivelemon ];
}

