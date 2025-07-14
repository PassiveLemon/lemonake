{ version
, src
, lib
, buildPythonApplication
, colorama
, evdev
, pillow
, pynput
, pyyaml
, setuptools
}:
buildPythonApplication rec {
  pname = "poepyautopot";
  inherit version src;

  format = "pyproject";

  strictDeps = true;

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
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
}

