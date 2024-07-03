# tModLoader dotnet fix
Link a Nix build of dotnet in place of the original. If your game doesn't launch because of non-Nix binaries, this may fix it.

## Example usage
```nix
# home.nix
{
  programs.tmodloader-dotnetfix = {
    enable = true;
    package = pkgs.dotnet-sdk_8;
    path = "/.steam/steam/steamapps/common/tModLoader";
  };
}
```
> [!IMPORTANT]
> The path attribute should be the path to your tModLoader installation from your home directory. Do not include your home directory in the path. If your tModLoader installation is not in your home directory, this module cannot be used.

## Full overview
```nix
# home.nix
{
  programs.tmodloader-dotnetfix = {
    enable = { type = bool; default = false; };
    package = { type = package; default = pkgs.dotnet-sdk_8; };
    path = {
      type = path;
      default = "/.local/share/Steam/steamapps/common/tModLoader";
    };
  };
}
```
