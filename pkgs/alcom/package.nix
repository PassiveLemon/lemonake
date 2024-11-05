{ version
, src
, lib
, appimageTools
, makeWrapper
}:
let
  pname = "alcom";

  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  nativeBuildInputs = [ makeWrapper ];

  # WEBKIT_DISABLE_DMABUF_RENDERER=1 needs to be set for it to not fail on runtime. Something with EGL Display
  extraInstallCommands = ''
    wrapProgram $out/bin/alcom --set WEBKIT_DISABLE_DMABUF_RENDERER 1

    install -Dm444 ${appimageContents}/ALCOM.desktop $out/share/applications/alcom.desktop
    install -Dm444 ${appimageContents}/ALCOM.png $out/share/pixmaps/alcom.png
    cp -r ${appimageContents}/usr/share/icons $out/share

    substituteInPlace $out/share/applications/alcom.desktop \
      --replace 'Exec=ALCOM' 'Exec=alcom' \
      --replace 'Icon=ALCOM' 'Icon=alcom'
  '';

  meta = with lib; {
    description = "GUI for vrc-get";
    homepage = "https://github.com/vrc-get/vrc-get/";
    license = licenses.bsl11;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "alcom";
  };
}

