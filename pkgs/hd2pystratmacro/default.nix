{ lib
, buildPythonApplication
, fetchFromGitHub
, evdev
, pyyaml
, setuptools
}:

buildPythonApplication rec {
  pname = "hd2pystratmacro";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "passivelemon";
    repo = "hd2pystratmacro";
    rev = "${version}";
    hash = "sha256-X3YSZxVWdxtnXBILDrYrF3IIkFh1b3e2/arecxfbhHE=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    evdev
    pyyaml
  ];
  
  doCheck = false;

  meta = with lib; {
    description = "A Python based macro script for Helldivers 2";
    homepage = "https://github.com/passiveLemon/hd2pystratmacro";
    changelog = "https://github.com/passiveLemon/hd2pystratmacro/releases/tag/${version}";
    license = licenses.gpl3;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "hd2pystratmacro";
  };
}
