{ version
, src
, lib
, buildNimPackage
, libevdev
, libXext
}:
buildNimPackage (finalAttrs: {
  pname = "webfisher";
  inherit version src;

  strictDeps = true;

  lockFile = ./lock.json;

  buildInputs = [
    libevdev
    libXext
  ];

  meta = with lib; {
    description = "A Nim based fishing script for Webfishing";
    homepage = "https://github.com/PassiveLemon/webfisher";
    changelog = "https://github.com/PassiveLemon/webfisher/releases/tag/${finalAttrs.version}";
    license = licenses.gpl3;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "webfisher";
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
})

