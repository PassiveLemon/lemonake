{ version
, src
, tilibsVersion
, tilibsSrc
, lib
, stdenv
, cmake
, glib
, gtk3
, libticables2
, libticalcs2
, libticonv
, libtifiles2
, pkg-config
}:
let
  libticables' = libticables2.overrideAttrs {
    version = tilibsVersion;
    src = tilibsSrc;
    sourceRoot = "source/libticables/trunk";
    patches = [ ];
  };
  libticonv' = libticonv.overrideAttrs {
    version = tilibsVersion;
    src = tilibsSrc;
    sourceRoot = "source/libticonv/trunk";
  };
  libtifiles' = libtifiles2.overrideAttrs {
    version = tilibsVersion;
    src = tilibsSrc;
    sourceRoot = "source/libtifiles/trunk";
  };
in stdenv.mkDerivation {
  pname = "tilp2";
  inherit version src;

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    glib
    gtk3
    libticables'
    libticalcs2
    libticonv'
    libtifiles'
  ];

  cmakeFlags = [
    (lib.cmakeBool "BUILD_USING_GTK3" true)
  ];

  meta = with lib; {
    description = "Transfer data between Texas Instruments graphing calculators and a computer";
    homepage = "https://github.com/debrouxl/tilp_and_gfm/";
    license = licenses.unfree;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    mainProgram = "tilp";
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
}

