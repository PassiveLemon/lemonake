{ lib
, fetchFromGitHub
, writeShellApplication
, inotify-tools
, xorgserver
}:
let
  src = fetchFromGitHub {
    owner = "gmdfalk";
    repo = "awmtt";
    rev = "92ababc7616bff1a7ac0a8e75e0d20a37c1e551e";
    hash = "sha256-3IpCuLIdN4t4FzFSHAlJ9FW9Y8UcWIqXG9DfiAwZoMY=";
  };
in
writeShellApplication {
  name = "awmtt";

  runtimeInputs = [
    inotify-tools
    xorgserver
  ];

  text = ''
    set +u
    ${builtins.readFile "${src}/awmtt.sh"}
  '';

  checkPhase = "";

  meta = with lib; {
    description = "A testing tool for AwesomeWM";
    homepage = "https://github.com/gmdfalk/awmtt/";
    license = licenses.mit;
    maintainers = with maintainers; [ passivelemon ];
    platforms = platforms.linux;
    mainProgram = "awmtt";
    sourceProvenance = with sourceTypes; [ fromSource ];
  };
}

