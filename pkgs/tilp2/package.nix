{ version
, src
, lib
, stdenv
, autoreconfHook
, gfm
, glib
, gnome2
, intltool
, libticables2
, libticalcs2
, libticonv
, libtifiles2
, pkg-config
}:
stdenv.mkDerivation {
  pname = "tilp2";
  inherit version src;

  sourceRoot = "source/tilp/trunk";

  nativeBuildInputs = [
    autoreconfHook
    intltool
    pkg-config
  ];

  buildInputs = [
    gfm
    glib
    gnome2.gtk
    gnome2.libglade
    libticables2
    libticalcs2
    libticonv
    libtifiles2
  ];

  meta = with lib; {
    description = "Transfer data between Texas Instruments graphing calculators and a computer";
    homepage = "http://lpg.ticalc.org/prj_tilp/";
    changelog = "http://lpg.ticalc.org/prj_tilp/news.html";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    mainProgram = "tilp";
  };
}

