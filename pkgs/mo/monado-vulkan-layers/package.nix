{ version
, src
, lib
, stdenv
, cmake
, vulkan-headers
, vulkan-loader
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "monado-vulkan-layers";
  inherit version src;

  patches = [
    ./absolute-layer-path.patch
  ];

  nativeBuildInputs = [
    cmake
  ];

  buildInputs = [
    vulkan-headers
    vulkan-loader
  ];

  meta = with lib; {
    description = "Vulkan Layers for Monado";
    homepage = "https://gitlab.freedesktop.org/monado/utilities/vulkan-layers";
    platforms = platforms.linux;
    license = licenses.boost;
    maintainers = with maintainers; [ scrumplex passivelemon ];
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
})

