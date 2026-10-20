{ version
, src
, wlrHash
, wlrVer
, lib
, stdenv
, fetchurl
, cairo
, dbus
, gdk-pixbuf
, git
, glib
, gobject-introspection
, gtk3
, hwdata
, lcms2
, libdisplay-info
, libdrm
, libgbm
, libinput
, libliftoff
, librsvg
, libxcb-errors
, libxcb-render-util
, libxcb-util
, libxcb-wm
, libxkbcommon
, linux-pam
, luajit
, makeWrapper
, meson
, ninja
, pango
, pkg-config
, seatd
, wayland
, wayland-scanner
, wayland-protocols
, xwayland
, extraGITypeLibPaths ? [ ]
, extraLuaModules ? [ ]
, extraSearchPaths ? [ ]
# Common extra dependencies, not required
, networkmanager
, upower
, playerctl
}:
let
  luaEnv = luajit.withPackages (ps: with ps; ([
    lgi # Required
  ] ++ extraLuaModules));

  getLuaPath = lib: dir: "${lib}/${dir}/lua/${luaEnv.luaversion}";
  makeSearchPaths = lib.concatMapStrings (
    path: "--add-flags  '--search ${getLuaPath path "share"}' \\" + "--add-flags '--search ${getLuaPath path "lib"}' \\"
  );
  finalSearchPaths = makeSearchPaths ([ luaEnv ] ++ extraSearchPaths);

  getTypeLibPath = pkg: "${pkg}/lib/girepository-1.0";
  makeGITypeLibPaths = lib.forEach (extraGITypeLibPaths ++ [
    networkmanager upower playerctl
  ]) getTypeLibPath;
  finalGITypeLibPaths = lib.concatStringsSep ":" makeGITypeLibPaths;

  # Supply the wlroots archive for the wlroots.wrap
  wlrootsSrc = fetchurl {
    url = "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/${wlrVer}/downloads/wlroots-${wlrVer}.tar.gz";
    sha256 = wlrHash;
  };
in
stdenv.mkDerivation (finalAttrs: {
  pname = "somewm";
  inherit version src;

  strictDeps = true;

  preConfigure = ''
    mkdir -p subprojects/packagecache
    cp ${wlrootsSrc} subprojects/packagecache/wlroots-${wlrVer}.tar.gz
  '';

  nativeBuildInputs = [
    gobject-introspection
    makeWrapper
    meson
    ninja
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    cairo
    dbus
    gdk-pixbuf
    git
    glib
    gtk3
    hwdata
    lcms2
    libdisplay-info
    libdrm
    libgbm
    libinput
    libliftoff
    librsvg
    libxcb-errors
    libxcb-render-util
    libxcb-util
    libxcb-wm
    libxkbcommon
    linux-pam
    luajit
    luaEnv
    pango
    seatd
    wayland
    wayland-scanner
    wayland-protocols
    xwayland
  ];

  mesonFlags = [ "-Dsystemd=disabled" ];

  postInstall = ''
    mkdir -p $out/share/wayland-sessions/
    install -m644 $src/somewm.desktop.in $out/share/wayland-sessions/somewm.desktop
  '';

  # --search $out/share/somewm/lua -> Awesome library
  # --search $out/lib -> liblgi_closure_guard.so
  postFixup = ''
    wrapProgram $out/bin/somewm \
      --add-flags '--search $out/share/somewm/lua' \
      --add-flags '--search $out/lib' \
      ${finalSearchPaths}
      --prefix GI_TYPELIB_PATH : $GI_TYPELIB_PATH:${finalGITypeLibPaths}

    substituteInPlace $out/share/wayland-sessions/somewm.desktop \
      --replace-fail 'Exec=@exec@' 'Exec=somewm' \
  '';

  meta = with lib; {
    description = "A Wayland compositor that brings AwesomeWM's Lua API to Wayland";
    homepage = "https://github.com/trip-zip/somewm/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    sourceProvenance = with sourceTypes; [ fromSource ];
    mainProgram = "somewm";
  };
})

