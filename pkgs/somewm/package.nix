{ version
, src
, lib
, stdenv
, cairo
, dbus
, gdk-pixbuf
, glib
, gobject-introspection
, libdrm
, libinput
, librsvg
, libxcb-util
, libxcb-wm
, libxkbcommon
, luajit
, makeWrapper
, pango
, pkg-config
, wayland
, wayland-scanner
, wayland-protocols
, wlroots_0_19
, xwayland
, gtk3Support ? false
, gtk3 ? null
, extraLuaModules ? [ ]
, extraSearchPaths ? [ ]
}:
assert gtk3Support -> gtk3 != null;
let
  luaEnv = luajit.withPackages (ps: with ps; ([
    lgi
  ] ++ extraLuaModules));

  getLuaPath = lib: dir: "${lib}/${dir}/lua/${luaEnv.luaversion}";
  makeSearchPath = lib.concatMapStrings (
    path: "--add-flags  '--search ${getLuaPath path "share"}' \\" + "--add-flags '--search ${getLuaPath path "lib"}' \\"
  );
in
stdenv.mkDerivation (finalAttrs: {
  pname = "somewm";
  inherit version src;

  strictDeps = true;

  nativeBuildInputs = [
    gobject-introspection
    makeWrapper
    pkg-config
  ];

  buildInputs = [
    cairo
    dbus
    gdk-pixbuf
    glib
    libdrm
    libinput
    librsvg
    libxcb-util
    libxcb-wm
    libxkbcommon
    luajit
    luaEnv
    pango
    wayland
    wayland-scanner
    wayland-protocols
    wlroots_0_19
    xwayland
  ] ++ lib.optional gtk3Support gtk3;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin/
    install -m755 somewm $out/bin/somewm
    install -m755 somewm-client $out/bin/somewm-client

    mkdir -p $out/share/wayland-sessions/
    install -m644 somewm.desktop $out/share/wayland-sessions/somewm.desktop

    runHook postInstall
  '';

  postFixup = ''
    mv "$out/bin/somewm" "$out/bin/.somewm-wrapped"
    makeWrapper "$out/bin/.somewm-wrapped" "$out/bin/somewm" \
      --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
      --add-flags '--search ${finalAttrs.src}/lua' \
      ${makeSearchPath ([ luaEnv ] ++ extraSearchPaths)}
      --prefix GI_TYPELIB_PATH : "$GI_TYPELIB_PATH"
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

