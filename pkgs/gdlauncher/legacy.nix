{ lib
, appimageTools
, fetchurl
, version
, hash
}:
let
  pname = "gdlauncher";
  src = fetchurl {
    inherit version hash;
    url = "https://github.com/gorilla-devs/GDLauncher/releases/download/v${version}/GDLauncher-linux-setup.AppImage";
  };

  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    mv $out/bin/gdlauncher-${version} $out/bin/gdlauncher

    install -Dm444 ${appimageContents}/gdlauncher.desktop -t $out/share/applications
    substituteInPlace $out/share/applications/gdlauncher.desktop \
      --replace 'Exec=AppRun --no-sandbox %U' 'Exec=gdlauncher'
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = with lib; {
    description = "A simple, yet powerful Minecraft custom launcher with a strong focus on the user experience";
    homepage = "https://gdlauncher.com/";
    changelog = "https://github.com/gorilla-devs/GDLauncher/releases/tag/v${version}";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "gdlauncher";
  };
}
