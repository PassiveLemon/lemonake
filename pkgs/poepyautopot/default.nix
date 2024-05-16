{ lib
, buildPythonApplication
, fetchFromGitHub
, colorama
, evdev
, pillow
, pynput
, pyyaml
, setuptools
}:
buildPythonApplication rec {
  pname = "poepyautopot";
  version = "1.3.6";

  src = fetchFromGitHub {
    owner = "passivelemon";
    repo = "poepyautopot";
    rev = version;
    hash = "sha256-XCyDONNJQwDT1RzpDKkOOPYmo9gzZhwgxP37kScEVLA=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    colorama
    evdev
    pillow
    pynput
    pyyaml
  ];

  doCheck = false;

  meta = with lib; {
    description = "A Python based Autopot script for Path of Exile";
    homepage = "https://github.com/passiveLemon/poepyautopot";
    changelog = "https://github.com/passiveLemon/poepyautopot/releases/tag/${version}";
    license = licenses.gpl3;
    maintainers = with maintainers; [ passivelemon ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "poepyautopot";
  };
}
