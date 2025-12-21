{ version
, src
, lib
, stdenv
, cmake
, linux-pam
, lua
}:
let
  installPhaseVer = ver: ''
    runHook preInstall

    mkdir -p $out/lib/lua/${ver}/
    cp liblua_pam.so $out/lib/lua/${ver}/liblua_pam.so

    runHook postInstall
  '';
in
stdenv.mkDerivation (finalAttrs: {
  pname = "lua-pam";
  inherit version src;

  strictDeps = true;

  postPatch = lib.optionalString lua.pkgs.isLuaJIT ''
    substituteInPlace CMakeLists.txt \
      --replace-fail "target_link_libraries(lua_pam lua pam)" "target_link_libraries(lua_pam luajit-5.1 pam)"
  '';

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

  installPhase = (
    if lua.pkgs.isLuaJIT
    then installPhaseVer "5.1"
    else installPhaseVer lua.version
  );

  meta = with lib; {
    description = "A module for lua to use PAM";
    homepage = "https://github.com/RMTT/lua-pam/";
    license = licenses.mit;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
})

