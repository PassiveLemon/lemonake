# AutoAdb
[GitHub](https://github.com/rom1v/autoadb)

## Example usage
```nix
# configuration.nix
{
  services.autoadb = {
    enable = true;
    package = pkgs.autoadb;
    command = "scrcpy -s '{}'";
    extraPackages = [ pkgs.scrcpy ];
  };
}
```

## Full overview
```nix
# configuration.nix
{
  services.autoadb = {
    enable = { type = bool; default = true; };
    package = { type = package; default = pkgs.autoadb; };
    command = { type = str; default = ""; };
    extraPackages = { type = listOf package; default = [ ]; };
  };
}
```
