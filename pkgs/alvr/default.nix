{ lib
, stdenv
, fetchzip
, fetchFromGitHub
, alsa-lib
, autoPatchelfHook
, brotli
, ffmpeg
, libdrm
, libGL
, libunwind
, libva
, libvdpau
, libxkbcommon
, nix-update-script
, openssl
, SDL2
, vulkan-loader
, wayland
, x264
, xorg
, xvidcore
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "alvr";
  version = "20.9.1";

  src = fetchzip {
    url = "https://github.com/alvr-org/ALVR/releases/download/v${finalAttrs.version}/alvr_streamer_linux.tar.gz";
    hash = "sha256-S8GeUskAqxzPqKC5XDiRDezV++vestlHLAzK001wkXQ=";
  };

  alvrSrc = fetchFromGitHub {
    owner = "alvr-org";
    repo = "ALVR";
    rev = "v${finalAttrs.version}";
    hash = "sha256-kw/UGh9nxZMVnvxyXV4CUm3HZegyjWolNoHHNindc5s=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    alsa-lib
    libunwind
    libva
    libvdpau
    vulkan-loader
    SDL2
  ];

  runtimeDependencies = [
    brotli
    ffmpeg
    openssl
    libdrm
    libGL
    libxkbcommon
    wayland
    x264
    xorg.libX11
    xorg.libXcursor
    xorg.libxcb
    xorg.libXi
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/applications
    cp -r $src/* $out
    install -Dm444 $alvrSrc/alvr/xtask/resources/alvr.desktop -t $out/share/applications
    install -Dm444 $alvrSrc/resources/alvr.png -t $out/share/icons/hicolor/256x256/apps

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "Stream VR games from your PC to your headset via Wi-Fi";
    homepage = "https://github.com/alvr-org/ALVR/";
    changelog = "https://github.com/alvr-org/ALVR/releases/tag/v${finalAttrs.version}";
    license = licenses.mit;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    mainProgram = "alvr_dashboard";
  };
})
