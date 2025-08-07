{ version
, src
, lib
, stdenv
, alsa-lib
, autoPatchelfHook
, curl
, dbus
, glib
, gtk3
, librsvg
, libsoup_3
, openssl
, pkg-config
, webkitgtk_4_1
, wget
, wrapGAppsHook3
}:
stdenv.mkDerivation {
	pname = "wayvr-dashboard";
	inherit version src;

	dontUnpack = true;
	dontConfigure = true;
	dontBuild = true;

	nativeBuildInputs = [
		autoPatchelfHook
		pkg-config
		wrapGAppsHook3
	];

	buildInputs = [
		alsa-lib
		curl
		dbus
		glib
		gtk3
		librsvg
		libsoup_3
		openssl
		webkitgtk_4_1
		wget
	];

	installPhase = ''
		runHook preInstall
	
		install -m755 -D $src $out/bin/wayvr-dashboard

		runHook postInstall
	'';

	doCheck = false;

	meta = with lib; {
    description = "A desktop environment and launcher for VR (wlx-overlay-s addon)";
    homepage = "https://github.com/olekolek1000/wayvr-dashboard";
    changelog = "https://github.com/olekolek1000/wayvr-dashboard/releases/";
    license = licenses.mit;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    mainProgram = "wayvr-dashboard";
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
}

