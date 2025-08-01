{ version
, src
, lib
, appimageTools
}:
let
  pname = "gdlauncher";

  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/gdlauncher.desktop -t $out/share/applications
    cp -r ${appimageContents}/usr/share/icons $out/share

    substituteInPlace $out/share/applications/gdlauncher.desktop \
      --replace-fail 'Exec=AppRun --no-sandbox %U' 'Exec=gdlauncher'
  '';

  meta = with lib; {
    description = "A simple, yet powerful Minecraft custom launcher with a strong focus on the user experience";
    homepage = "https://gdlauncher.com/";
    changelog = "https://github.com/gorilla-devs/GDLauncher/releases/tag/v${version}";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "gdlauncher";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
  };
}

