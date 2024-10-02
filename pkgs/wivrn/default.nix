{ version
, src
, monadoSrc
, config
, lib
, stdenv
, applyPatches
, autoAddDriverRunpath
, avahi
, boost
, cli11
, cmake
, cudaPackages ? { }
, cudaSupport ? config.cudaSupport
, eigen
, ffmpeg
, freetype
, git
, glib
, glm
, glslang
, harfbuzz
, libdrm
, libGL
, libva
, libpulseaudio
, libX11
, libXrandr
, nix-update-script
, nlohmann_json
, onnxruntime
, openxr-loader
, pipewire
, pkg-config
, python3
, shaderc
, spdlog
, systemd
, udev
, vulkan-headers
, vulkan-loader
, vulkan-tools
, x264
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "wivrn";
  inherit version src;

  monado = applyPatches {
    src = monadoSrc;

    patches = [
      ./force-enable-steamvr_lh.patch
    ];

    postPatch = ''
      ${finalAttrs.src}/patches/apply.sh ${finalAttrs.src}/patches/monado
    '';
  };

  strictDeps = true;

  postUnpack = ''
    # Let's make sure our monado source revision matches what is used by WiVRn upstream
    ourMonadoRev="${finalAttrs.monado.src.rev}"
    theirMonadoRev=$(grep "GIT_TAG" ${finalAttrs.src.name}/CMakeLists.txt | awk '{print $2}')
    if [ ! "$theirMonadoRev" == "$ourMonadoRev" ]; then
      echo "Our Monado source revision doesn't match CMakeLists.txt." >&2
      echo "  theirs: $theirMonadoRev" >&2
      echo "    ours: $ourMonadoRev" >&2
      return 1
    fi
  '';

  nativeBuildInputs = [
    cmake
    git
    glib
    glslang
    pkg-config
    python3
  ] ++ lib.optionals cudaSupport [
    autoAddDriverRunpath
  ];

  buildInputs = [
    avahi
    boost
    cli11
    eigen
    ffmpeg
    freetype
    glib
    glm
    harfbuzz
    libdrm
    libGL
    libva
    libX11
    libXrandr
    libpulseaudio
    nlohmann_json
    onnxruntime
    openxr-loader
    pipewire
    shaderc
    spdlog
    systemd
    udev
    vulkan-headers
    vulkan-loader
    vulkan-tools
    x264
  ] ++ lib.optionals cudaSupport [
    cudaPackages.cudatoolkit
  ];

  cmakeFlags = [
    (lib.cmakeBool "WIVRN_USE_VAAPI" true)
    (lib.cmakeBool "WIVRN_USE_X264" true)
    (lib.cmakeBool "WIVRN_USE_NVENC" cudaSupport)
    (lib.cmakeBool "WIVRN_USE_SYSTEMD" true)
    (lib.cmakeBool "WIVRN_USE_PIPEWIRE" true)
    (lib.cmakeBool "WIVRN_USE_PULSEAUDIO" true)
    (lib.cmakeBool "WIVRN_FEATURE_STEAMVR_LIGHTHOUSE" true)
    (lib.cmakeBool "WIVRN_BUILD_CLIENT" false)
    (lib.cmakeBool "WIVRN_OPENXR_INSTALL_ABSOLUTE_RUNTIME_PATH" true)
    (lib.cmakeBool "FETCHCONTENT_FULLY_DISCONNECTED" true)
    (lib.cmakeFeature "FETCHCONTENT_SOURCE_DIR_MONADO" "${finalAttrs.monado}")
  ];

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "An OpenXR streaming application to a standalone headset";
    homepage = "https://github.com/Meumeu/WiVRn/";
    changelog = "https://github.com/Meumeu/WiVRn/releases/";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    mainProgram = "wivrn-server";
  };
})

