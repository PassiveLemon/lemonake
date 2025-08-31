{ version
, src
, lib
, buildNimPackage
, libevdev
}:
buildNimPackage (finalAttrs: {
  pname = "nimpad";
  inherit version src;

  strictDeps = true;

  lockFile = ./lock.json;

  buildInputs = [
    libevdev
  ];

  meta = with lib; {
    description = "A Nim based client for a DIY macropad";
    homepage = "https://github.com/PassiveLemon/nimpad";
    changelog = "https://github.com/PassiveLemon/nimpad/releases/tag/${finalAttrs.version}";
    license = licenses.gpl3;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "nimpad";
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
})

