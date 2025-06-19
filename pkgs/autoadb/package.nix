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

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    cp ${./Cargo.lock} Cargo.lock
  '';

  meta = with lib; {
    description = "Execute a command whenever a device is adb-connected";
    homepage = "https://github.com/rom1v/autoadb";
    license = licenses.asl20;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "autoadb";
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
}

