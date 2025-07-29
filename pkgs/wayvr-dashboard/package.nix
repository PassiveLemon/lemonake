{ version
, src
, lib
, rustPlatform
, buildNpmPackage
, importNpmLock
, alsa-lib
, autoPatchelfHook
, curl
, dbus
, glib
, gtk3
, librsvg
, libsoup_2_4
, openssl
, pkg-config
, webkitgtk_4_1
, wget
, wrapGAppsHook3
}:
rustPlatform.buildRustPackage rec {
	pname = "wayvr-dashboard";
	inherit version src;

	sourceRoot = "${src.name}/src-tauri";

	useFetchCargoVendor = true;
	cargoHash = "";

	frontend = buildNpmPackage {
		inherit version src;
		pname = "wayvr-dashboard-ui";

		npmDeps = importNpmLock {
			npmRoot = src;
		};

		npmConfigHook = importNpmLock.npmConfigHook;

		nativeBuildInputs = [
			autoPatchelfHook
		];

		dontAutoPatchelf = true;

		preBuild = ''
			autoPatchelf node_modules/sass-embedded-linux-x64/dart-sass/src/dart
		'';

		postBuild = ''
			cp -r dist/ $out
		'';
	};

	postPatch = ''
		substituteInPlace tauri.conf.json \
			--replace-fail '"frontendDist": "../dist"' '"frontendDist": "${frontend}"'
		substituteInPlace tauri.conf.json \
			--replace-fail '"npm run build"' '""'
	'';

	nativeBuildInputs = [
		pkg-config
		rustPlatform.bindgenHook
		wrapGAppsHook3
	];

	buildInputs = [
		alsa-lib
		curl
		dbus
		glib
		gtk3
		librsvg
		libsoup_2_4
		openssl
		webkitgtk_4_1
		wget
	];

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

