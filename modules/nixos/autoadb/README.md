# AutoAdb
[GitHub](https://github.com/rom1v/autoadb)

Everything in the command attribute is turned into a shell script and passed to a systemd service.

## Example usage
```nix
# configuration.nix
{
  services.autoadb = {
    enable = true;
    package = pkgs.autoadb;
    command = "
      adb shell settings put global sem_enhanced_cpu_responsiveness 1
      scrcpy -s '{}'
    ";
    extraPackages = [ pkgs.scrcpy ];
  };
}
```

## Full overview
```nix
# configuration.nix
{
  services.autoadb = {
    enable = { type = bool; default = false; };
    package = { type = package; default = pkgs.autoadb; };
    command = { type = str; default = ""; };
    extraPackages = { type = listOf package; default = [ ]; };
  };
}
```
