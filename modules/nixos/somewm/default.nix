{ config, pkgs, lib, ... }:
let
  inherit (lib) mkIf mkEnableOption mkPackageOption getExe maintainers;
  cfg = config.programs.somewm;
in
{
  options = {
    programs.somewm = {
      enable = mkEnableOption "somewm";

      package = mkPackageOption pkgs "somewm" { };

      enableUWSM = mkEnableOption "somewm uwsm entry";
    };
  };

  config = mkIf cfg.enable {
    programs.uwsm = mkIf cfg.enableUWSM {
      enable = true;
      waylandCompositors = {
        somewm = {
          prettyName = "SomeWM";
          comment = "SomeWM compositor managed by UWSM";
          binPath = "${getExe cfg.package}";
        };
      };
    };

    services.dbus.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        gnome-keyring
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };

    environment.systemPackages = [
      cfg.package
    ];
  };
  meta.maintainers = with maintainers; [ passivelemon ];
}

