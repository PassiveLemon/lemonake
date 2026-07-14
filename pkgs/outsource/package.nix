{ version
, src
, lib
, stdenv
, lua
, makeWrapper
}:
let
  luaEnv = lua.withPackages (ps: with ps; ([
    luaposix
  ]));
in
stdenv.mkDerivation (finalAttrs: {
  pname = "outsource";
  inherit version src;

  strictDeps = true;

  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ luaEnv ];

  installPhase = ''
    runHook preInstall

    output=$out/lib/lua/${lua.luaversion}/outsource
    mkdir -p $output
    mkdir -p $out/bin

    cp -r $src/src/* $output
    ln -s $output/outsource.lua $out/bin/outsource

    makeWrapper "$out/bin/outsource" "$out/bin/outsource-ffmpeg" \
      --set LUA_PATH "$output/?.lua" \
      --set OUTSOURCE_MODE "ffmpeg"

    makeWrapper "$out/bin/outsource" "$out/bin/outsource-ffprobe" \
      --set LUA_PATH "$output/?.lua" \
      --set OUTSOURCE_MODE "ffprobe"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Outsource your FFmpeg calls to a different machine, with directory mapping";
    homepage = "https://github.com/PassiveLemon/outsource";
    changelog = "https://github.com/PassiveLemon/outsource/releases/tag/${finalAttrs.version}";
    license = licenses.gpl3;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "outsource";
  };
})

