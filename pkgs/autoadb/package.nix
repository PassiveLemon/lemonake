{ lib
, rustPlatform
, fetchFromGitHub
}:
rustPlatform.buildRustPackage {
  pname = "autoadb";
  version = "unstable-2020-06-01";

  src = fetchFromGitHub {
    owner = "rom1v";
    repo = "autoadb";
    rev = "7f8402983603a9854bf618a384f679a17cd85e2d";
    sha256 = "sha256-9Sv38dCtvbqvxSnRpq+HsIwF/rfLUVZbi0J+mltLres=";
  };

  fetchCargoVendor = true;
  cargoHash = "sha256-xxmBgJqtWq1FLWTaC8SjaBoSXkPcIZYrSOc+hCEN778=";

  meta = with lib; {
    description = "Execute a command whenever a device is adb-connected";
    homepage = "https://github.com/rom1v/autoadb";
    # Set redistributable to false to skip build workflow because autoadb (seemingly deprecated) uses an older cargo format that isn't supported by fetchCargoVendor
    license = licenses.asl20 // { redistributable = false; };
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "autoadb";
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
}

