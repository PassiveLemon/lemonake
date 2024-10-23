{ lib, getPackage, ... }: {
  flake.overlays = {
    opencomposite = final: prev: {
      # https://gitlab.com/znixian/OpenOVR/-/issues/416
      opencomposite-git = let
        package = getPackage "opencomposite-git" prev;
      in
      prev.opencomposite.overrideAttrs (prevAttrs: {
        inherit (package) version src;

        cmakeFlags = prevAttrs.cmakeFlags ++ [
          (lib.cmakeBool "USE_SYSTEM_OPENXR" false)
        ];
      });
    };
  };
}

