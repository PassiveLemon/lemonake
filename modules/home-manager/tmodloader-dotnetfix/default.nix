{ config, pkgs, lib, ... }:
let
  inherit (lib) mkIf mkEnableOption mkPackageOption mkOption getExe literalExpression types maintainers;
  cfg = config.programs.tmodloader-dotnetfix;

  tmodloaderPath = config.home.homeDirectory + cfg.path + "/dotnet/dotnet";
in
{
  options = {
    programs.tmodloader-dotnetfix = {
      enable = mkEnableOption ''
        a fix for the tModLoader dotnet.
        This can only be used if tModLoader is installed in the users home.
      '';

      package = mkPackageOption pkgs "dotnet-sdk_8" { };

      path = mkOption {
        type = types.path;
        description = "Path to your tModLoader installation from your home directory.";
        default = "/.local/share/Steam/steamapps/common/tModLoader";
        example = literalExpression "/.steam/steam/steamapps/common/tModLoader";
      };
    };
  };

  config = mkIf cfg.enable {
    home.file = {
      "${tmodloaderPath}" = {
        source = (getExe cfg.package);
      };
    };
  };
  meta.maintainers = with maintainers; [ passivelemon ];
}
