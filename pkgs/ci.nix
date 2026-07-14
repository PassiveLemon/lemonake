{ self, lib, ... }:
let
  inherit (lib) isList all attrNames filterAttrs subtractLists filter hasSuffix elem;
in
{
  perSystem = { system, ... }:
  let
    testLicense = license:
      (license ? redistributable) &&
      license.redistributable;

    isRedistributable = pkg:
      (pkg ? meta) &&
      (pkg.meta ? license) &&
      (if isList pkg.meta.license
      then all testLicense pkg.meta.license
      else testLicense pkg.meta.license);

    flakePkgs = self.packages.${system};
    redistributablePkgs = attrNames (filterAttrs (_: pkg: isRedistributable pkg) flakePkgs);
    nonRedistributablePkgs = subtractLists redistributablePkgs (attrNames flakePkgs);

    filterType = suffix: pkgSet: filter (name: hasSuffix suffix name) pkgSet;

    getSet = pkgSet: let
      tagList = filterType "-tag" pkgSet;
      gitList = filterType "-git" pkgSet;
    in {
      release = subtractLists (tagList ++ gitList) pkgSet;
      tag = tagList;
      git = gitList;
    };
  in
  {
    CIPackageSets = {
      redistributable = getSet redistributablePkgs;
      nonRedistributable = getSet nonRedistributablePkgs;
    };
  };
}

