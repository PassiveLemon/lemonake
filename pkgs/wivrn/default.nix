{ config
, lib
, stdenv
, fetchFromGitHub
, fetchFromGitLab
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
  version = "0.18";

  src = fetchFromGitHub {
    owner = "wivrn";
    repo = "wivrn";
    rev = "v${finalAttrs.version}";
    hash = "sha256-JFiDjx2iQfBDD1yRWHPx0UiIAqEk8+nzf967o/HXYqs=";
  };

  monado = applyPatches {
    src = fetchFromGitLab {
      domain = "gitlab.freedesktop.org";
      owner = "monado";
      repo = "monado";
      rev = "dfc602288ab05131584a3f2be18031a13fccd061";
      hash = "sha256-4HZs3cgqOWWpXQb5kfG513f7+znO0hJvAbj2rxrqmeI=";
    };

    patches = [
      "${finalAttrs.src}/patches/monado/0001-c-multi-disable-dropping-of-old-frames.patch"
      "${finalAttrs.src}/patches/monado/0002-ipc-server-Always-listen-to-stdin.patch"
      "${finalAttrs.src}/patches/monado/0003-c-multi-Don-t-log-frame-time-diff.patch"
    ];
  };

  strictDeps = true;

  postUnpack = ''
    # Let's make sure our monado source revision matches what is used by WiVRn upstream
    ourMonadoRev="${finalAttrs.monado.src.rev}"
    theirMonadoRev=$(grep -A1 "https://gitlab.freedesktop.org/monado/monado" ${finalAttrs.src.name}/CMakeLists.txt | tail -n1 | sed 's/.*GIT_TAG\s*//')
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

