{ lib
, buildPythonApplication
, fetchFromGitHub
, evdev
, pyyaml
, setuptools
}:
buildPythonApplication rec {
  pname = "hd2pystratmacro";
  version = "1.0.3";

  src = fetchFromGitHub {
    owner = "passivelemon";
    repo = "hd2pystratmacro";
    rev = version;
    hash = "sha256-dinijveo5/FrJdLWildK7JwY9ZciAJ+PUWvFw5dUluA=";
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
