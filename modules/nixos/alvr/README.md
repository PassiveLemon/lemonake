# ALVR
[GitHub](https://github.com/alvr-org/alvr)

## Example usage
```nix
# configuration.nix
{
  programs.alvr = {
    enable = true;
    package = pkgs.alvr;
    openFirewall = true;
  };
}
```

