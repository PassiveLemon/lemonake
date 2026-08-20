{ version
, src
, lib
, stdenv
, cmake
, libGL
, libX11
, nlohmann_json
, openxr-loader
, pkg-config
, vulkan-headers
, vulkan-loader
}:
stdenv.mkDerivation {
  pname = "vapor";
  inherit version src;

  strictDeps = true;

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    libGL
    libX11
    nlohmann_json
    openxr-loader
    vulkan-headers
    vulkan-loader
  ];

  meta = with lib; {
    description = "an implementation of an OpenVR runtime on top of OpenXR";
    homepage = "https://github.com/micheal65536/VapoR/";
    changelog = "https://github.com/micheal65536/VapoR/";
    license = licenses.bsd2;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
}

