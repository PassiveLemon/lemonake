{ version
, src
, lib
, stdenv
, cmake
, linux-pam
, lua
, nix-update-script
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "lua-pam";
  inherit version src;

  strictDeps = true;

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    linux-pam
    lua
  ];

  buildPhase = ''
    runHook preBuild

    cmake . -B build
    cd build
    make

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib
    cp liblua_pam.so $out/lib

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "A module for lua to use PAM";
    homepage = "https://github.com/RMTT/lua-pam/";
    license = licenses.mit;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
  };
})

