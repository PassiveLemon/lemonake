{ version
, src
, lib
, buildDotnetModule
, dotnetCorePackages
}:
buildDotnetModule {
  pname = "adgobye";
  inherit version src;

  projectFile = "AdGoBye/AdGoBye.csproj";
  # dotnet restore --packages=packageDir AdGoBye.csproj && nuget-to-nix packageDir > deps.nix; rm -r packageDir
  # These may need to be declared for git and stable individually at some point
  nugetDeps = ./deps.nix;

  dotnet-sdk = dotnetCorePackages.sdk_8_0;
  dotnet-runtime = dotnetCorePackages.runtime_8_0;

  executables = [ "AdGoBye" ];

  meta = with lib; {
    description = "Content / Adblock for Social VR";
    homepage = "https://github.com/AdGoBye/AdGoBye/";
    changelog = "https://github.com/AdGoBye/AdGoBye/releases/";
    license = licenses.mit;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    mainProgram = "adgobye";
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
}

