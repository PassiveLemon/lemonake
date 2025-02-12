{ version
, src
, lib
, stdenv
, cmake
, libGL
, nlohmann_json
, openxr-loader
, pkg-config
, vulkan-headers
, vulkan-loader
, xorg
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
    nlohmann_json
    openxr-loader
    vulkan-headers
    vulkan-loader
    xorg.libX11
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/vapor/bin/linux64
    cp src/vrclient.so $out/lib/
    ln -s "$out/lib/vrclient.so" "$out/lib/vapor/bin/linux64/vrclient.so"

    runHook postInstall
  '';

  meta = with lib; {
    description = "an implementation of an OpenVR runtime on top of OpenXR";
    homepage = "https://github.com/micheal65536/VapoR/";
    changelog = "https://github.com/micheal65536/VapoR/";
    license = licenses.bsd2;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
  };
}

