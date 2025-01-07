{ version
, src
, lib
, rustPlatform
, cmake
, libclang
, shaderc
, vulkan-headers
, vulkan-loader
, xorg
}:
rustPlatform.buildRustPackage {
  pname = "xrizer";
  inherit version src;

  useFetchCargoVendor = true;
  cargoHash = "sha256-xyiEKPnko9mpEsUfl7wuAAsobRTwBHhZuKuU/HP4Ujs=";

  nativeBuildInputs = [
    cmake
    libclang
    rustPlatform.bindgenHook
    shaderc
    vulkan-headers
    vulkan-loader
  ];

  buildInputs = [
    xorg.libX11
    xorg.libxcb
  ];

  meta = with lib; {
    description = "A reimplementation of OpenVR on top of OpenXR";
    homepage = "https://github.com/Supreeeme/xrizer/";
    changelog = "https://github.com/Supreeeme/xrizer/releases/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
  };
}

