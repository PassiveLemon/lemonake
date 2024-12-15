{ version
, src
, lib
, stdenv
, autoreconfHook
, glib
, gnome2
, gtk2
, libticables2
, libticalcs2
, libticonv
, libtifiles2
, pkg-config
}:
stdenv.mkDerivation {
  pname = "gfm";
  inherit version src;

  sourceRoot = "source/gfm/trunk";

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  buildInputs = [
    glib
    gnome2.libglade
    gtk2
    libticables2
    libticalcs2
    libticonv
    libtifiles2
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
  };
}

