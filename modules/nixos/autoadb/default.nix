{ config, pkgs, lib, ... }:
let
  inherit (lib) mkIf mkEnableOption mkPackageOption mkOption literalExpression types maintainers;
  cfg = config.services.autoadb;
in
{
  options = {
    services.autoadb = {
      enable = mkEnableOption ''
        AutoAdb, a command-line tool to execute a command whenever a new device is connected to adb.
        This module enables `programs.adb`
      '';

      package = mkPackageOption pkgs "autoadb" { };

      command = mkOption {
        type = types.str;
        description = "The command to run whenever a device connects to adb. Multiple commands on new lines can be entered.";
        default = "";
        example = literalExpression ''
          adb shell settings put global sem_enhanced_cpu_responsiveness 1
          scrcpy -s '{}'
        '';
      };

      extraPackages = mkOption {
        type = types.listOf types.package;
        description = "Packages to add to the service $PATH. Android-tools is included by default.";
        default = [ ];
        example = literalExpression "[ pkgs.scrcpy pkgs.adb-sync ]";
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.user = {
      services.autoadb = {
        description = "AutoAdb service";
        unitConfig = {
          StartLimitBurst = 5;
          StartLimitIntervalSec = 500;
        };
        serviceConfig = {
          Restart = "on-failure";
          RestartSec = "5s";
        };
        script = ''
          ${cfg.command}
        '';
        wantedBy = [ "default.target" ];
        path = [ cfg.package pkgs.android-tools ] ++ cfg.extraPackages;
        restartTriggers = [
          cfg.package
        ];
      };
    };

    programs.adb.enable = true;

    environment.systemPackages = [ cfg.package ];
  };
  meta.maintainers = with maintainers; [ passivelemon ];
}

