# AutoAdb
[AutoAdb GitHub](https://github.com/rom1v/autoadb)

The autoadb service module simply runs autoadb in a systemd service and allows packages to be exposed. Everything in the command attribute is turned into a shell script and passed to the systemd service.

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

