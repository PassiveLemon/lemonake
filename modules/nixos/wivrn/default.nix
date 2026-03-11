{ lib, ... }: {
  imports = [
    (lib.mkRemovedOptionModule [ "services" "wivrn" ] ''
      This module has been identical to the nixpkgs wivrn module for a long time, use that instead.
    '')
  ];
}

