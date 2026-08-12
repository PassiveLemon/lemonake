{ version
, src
, lib
, stdenv
, autoreconfHook
, cmake
, glib
, gtk3
, libticables2
, libticalcs2
, libticonv
, libtifiles2
, ninja
, pkg-config
}:
stdenv.mkDerivation {
  pname = "gfm";
  inherit version src;

  sourceRoot = "source/gfm/trunk";

  nativeBuildInputs = [
    autoreconfHook
    cmake
    ninja
    pkg-config
  ];

  buildInputs = [
    glib
    gtk3
    libticables2
    libticalcs2
    libticonv
    libtifiles2
  ];

  cmakeFlags = [
    (lib.cmakeBool "BUILD_USING_GTK3" true)
  ];

  NIX_CFLAGS_COMPILE = "-I${libticables2}/include/tilp2";

  meta = with lib; {
    description = "Group File Manager (GFM) allows manipulation of single/group/tigroup files";
    homepage = "http://lpg.ticalc.org/prj_gfm/index.html";
    changelog = "http://lpg.ticalc.org/prj_tilp/news.html";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    mainProgram = "gfm";
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
}

