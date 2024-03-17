{ config, pkgs, lib, ... }:

let
  cfg = config.programs.alvr;
  inherit (lib) mkIf mkEnableOption mkPackageOption mkOption mdDoc types maintainers;
in
{
  options = {
    programs.alvr = {
      enable = mkEnableOption "ALVR, the VR desktop streamer";

      package = mkPackageOption pkgs "ALVR" { };

      openFirewall = mkEnableOption "the default ports in the firewall for the ALVR server";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];

    networking.firewall = mkIf cfg.openFirewall {
      allowedTCPPorts = [ 9943 9944 ];
      allowedUDPPorts = [ 9943 9944 ];
    };
  };
  meta.maintainers = with maintainers; [ passivelemon ];
}
