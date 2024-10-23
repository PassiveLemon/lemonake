{ version
, src
, alvrSrc
, lib
, stdenv
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
, config
, cudaPackages
, cudaSupport ? config.cudaSupport
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "alvr";
  inherit version src alvrSrc;

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
    xvidcore
  ]
  ++ lib.optionals cudaSupport [
    cudaPackages.cuda_nvcc
    cudaPackages.cuda_cudart
    cudaPackages.libnpp
    libva
    libdrm
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

