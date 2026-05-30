{ version
, src
, lib
, stdenv
, cairo
, cmake
, dbus
, gdk-pixbuf
, gobject-introspection
, gtk3
, imagemagick
, librsvg
, libstartup_notification
, libxcb
, libxcb-cursor
, libxcb-wm
, libxcb-keysyms
, libxcb-image
, libxcb-util
, libxdg_basedir
, libxkbcommon
, lua
, makeWrapper
, pango
, pkg-config
, xcbutilxrm
, extraGITypeLibPaths ? [ ]
, extraLuaModules ? [ ]
, extraSearchPaths ? [ ]
# Common extra dependencies, not required
, networkmanager
, upower
, playerctl
}:
let
  cairo' = cairo.override { xcbSupport = true; };

  luaEnv = lua.withPackages (ps: with ps; ([
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
in
stdenv.mkDerivation (finalAttrs: {
  pname = "awesome";
  inherit version src;

  postPatch = ''
    patchShebangs tests/examples/_postprocess.lua
    patchShebangs tests/examples/_postprocess_cleanup.lua
  '';

  nativeBuildInputs = [
    cmake
    gobject-introspection
    imagemagick
    makeWrapper
    pkg-config
  ];

  buildInputs = [
    cairo'
    dbus
    gdk-pixbuf
    gtk3
    librsvg
    libstartup_notification
    libxcb
    libxcb-cursor
    libxcb-image
    libxcb-keysyms
    libxcb-util
    libxcb-wm
    libxdg_basedir
    libxkbcommon
    lua
    luaEnv
    pango
    xcbutilxrm
  ];

  cmakeFlags = [
    "-DOVERRIDE_VERSION=${finalAttrs.version}"
  ] ++ lib.optional lua.pkgs.isLuaJIT "-DLUA_LIBRARY=${lua}/lib/libluajit-5.1.so";

  env = {
    GI_TYPELIB_PATH = "${pango.out}/lib/girepository-1.0";
  };

  postFixup = ''
    # Don't use wrapProgram or the wrapper will duplicate the --search arguments every restart
    mv "$out/bin/awesome" "$out/bin/.awesome-wrapped"
    makeWrapper "$out/bin/.awesome-wrapped" "$out/bin/awesome" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --add-flags '--search ${finalAttrs.src}/lua' \
      ${finalSearchPaths}
      --prefix GI_TYPELIB_PATH : "$GI_TYPELIB_PATH:${finalGITypeLibPaths}"
  '';

  passthru = {
    inherit lua;
  };

  meta = with lib; {
    description = "Highly configurable, dynamic window manager for X";
    homepage = "https://awesomewm.org/";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    sourceProvenance = with sourceTypes; [ fromSource ];
    mainProgram = "awesome";
  };
})

