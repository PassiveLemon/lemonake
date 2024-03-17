# ALVR
[GitHub](https://github.com/alvr-org/alvr)

## Example usage
```nix
programs.alvr = {
  enable = true;
  package = pkgs.alvr;
  openFirewall = true;
};
```

## Full overview
```nix
programs.alvr = {
  enable = { type = bool; default = true; };
  package = { type = package; default = pkgs.alvr; };
  openFirewall = { type = bool; default = false; };
};
```
