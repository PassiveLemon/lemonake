{ config, pkgs, lib, ... }:
let
  inherit (lib) mkIf mkEnableOption mkPackageOption mkOption types maintainers;
  cfg = config.wayland.windowManager.somewm;
  systemdModule = {
    options = {
      # TODO
    };
  };
in
{
  options = {
    wayland.windowManager.somewm = {
      enable = mkEnableOption "somewm";

      package = mkPackageOption pkgs "somewm" { };

      systemd = mkOption {
        type = types.submodule systemdModule;
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
  };
  meta.maintainers = with maintainers; [ passivelemon ];
}

