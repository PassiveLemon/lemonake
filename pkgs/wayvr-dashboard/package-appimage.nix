{ version
, src
, lib
, appimageTools
}:
let
  pname = "wayvr-dashboard";

  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/wayvr-dashboard.desktop -t $out/share/applications
    install -Dm444 ${appimageContents}/wayvr-dashboard.svg $out/share/icons/hicolor/scalable/apps/wayvr-dashboard.png
    cp -r ${appimageContents}/usr/share/icons $out/share

    substituteInPlace $out/share/applications/wayvr-dashboard.desktop \
      --replace 'Icon=wayvr-dashboard' 'Icon=wayvr-dashboard'
  '';

  meta = with lib; {
    description = "A desktop environment and launcher for VR (wlx-overlay-s addon)";
    homepage = "https://github.com/olekolek1000/wayvr-dashboard";
    changelog = "https://github.com/olekolek1000/wayvr-dashboard/releases/";
    license = licenses.mit;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    mainProgram = "wayvr-dashboard";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
  };
}

