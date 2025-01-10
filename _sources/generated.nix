# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  adgobye = {
    pname = "adgobye";
    version = "v4.0.2+v4IsBrokenPullMe";
    src = fetchFromGitHub {
      owner = "AdGoBye";
      repo = "AdGoBye";
      rev = "v4.0.2+v4IsBrokenPullMe";
      fetchSubmodules = false;
      sha256 = "sha256-YDrSmLNQti6Jk6uljpN47f3GirtStcGuPc0GCz9OTBA=";
    };
  };
  adgobye-git = {
    pname = "adgobye-git";
    version = "9ef438f4bffdc032ea7dc7d1fa7c01f5527ce21b";
    src = fetchFromGitHub {
      owner = "AdGoBye";
      repo = "AdGoBye";
      rev = "9ef438f4bffdc032ea7dc7d1fa7c01f5527ce21b";
      fetchSubmodules = false;
      sha256 = "sha256-96WEFSWe1YaCAs702md5UTmgovx6FjiFUfr6wnQXnv4=";
    };
    date = "2024-10-05";
  };
  alcom = {
    pname = "alcom";
    version = "1.0.1-beta.1";
    src = fetchurl {
      url = "https://github.com/vrc-get/vrc-get/releases/download/gui-v1.0.1-beta.1/alcom-1.0.1-beta.1-x86_64.AppImage";
      sha256 = "sha256-1Ee1O/3Va+bBvCBhpZNrZQPXXkNE/8nO9WTKWY0ksg4=";
    };
  };
  animdl-git = {
    pname = "animdl-git";
    version = "c7c3b79198e66695e0bbbc576f9d9b788616957f";
    src = fetchFromGitHub {
      owner = "justfoolingaround";
      repo = "animdl";
      rev = "c7c3b79198e66695e0bbbc576f9d9b788616957f";
      fetchSubmodules = false;
      sha256 = "sha256-kn6vCCFhJNlruxoO+PTHVIwTf1E5j1aSdBhrFuGzUq4=";
    };
    date = "2023-10-17";
  };
  gdlauncher-carbon = {
    pname = "gdlauncher-carbon";
    version = "2.0.20";
    src = fetchurl {
      url = "https://cdn-raw.gdl.gg/launcher/GDLauncher__2.0.20__linux__x64.AppImage";
      sha256 = "sha256-tI9RU8qO3MHbImOGw2Wl1dksNbhqrYFyGemqms8aAio=";
    };
  };
  gdlauncher-legacy = {
    pname = "gdlauncher-legacy";
    version = "v1.1.30";
    src = fetchurl {
      url = "https://github.com/gorilla-devs/GDLauncher/releases/download/v1.1.30/GDLauncher-linux-setup.AppImage";
      sha256 = "sha256-4cXT3exhoMAK6gW3Cpx1L7cm9Xm0FK912gGcRyLYPwM=";
    };
  };
  hd2pystratmacro = {
    pname = "hd2pystratmacro";
    version = "1.0.2";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "hd2pystratmacro";
      rev = "1.0.2";
      fetchSubmodules = false;
      sha256 = "sha256-SarYj6e3a9x45kWJNPFxSTfnsuxvfF40JD5e8efHxTw=";
    };
  };
  hd2pystratmacro-git = {
    pname = "hd2pystratmacro-git";
    version = "48da6bd37369277ed92ba1fe8a1fdb5acc330a79";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "hd2pystratmacro";
      rev = "48da6bd37369277ed92ba1fe8a1fdb5acc330a79";
      fetchSubmodules = false;
      sha256 = "sha256-D1x4GcAaovvrkIa0FCQS/MApu0X/RD1qCcI8pB31HOc=";
    };
    date = "2024-12-30";
  };
  lua-pam-git = {
    pname = "lua-pam-git";
    version = "373de20d6784f77d59abc1ffc1d0302f28ed46cd";
    src = fetchFromGitHub {
      owner = "RMTT";
      repo = "lua-pam";
      rev = "373de20d6784f77d59abc1ffc1d0302f28ed46cd";
      fetchSubmodules = false;
      sha256 = "sha256-AFCAudWQa3UiNvum4Ir6SY1WhGMaBSjgKyu6jG5efAA=";
    };
    date = "2023-11-26";
  };
  monado-vulkan-layers-git = {
    pname = "monado-vulkan-layers-git";
    version = "ae43cdcbd25c56e3481bbc8a0ce2bfcebba9f7c2";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/utilities/vulkan-layers.git";
      rev = "ae43cdcbd25c56e3481bbc8a0ce2bfcebba9f7c2";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-QabYVKcenW+LQ+QSjUoQOLOQAVHdjE0YXd+1WsdzNPc=";
    };
    date = "2024-02-21";
  };
  opencomposite-git = {
    pname = "opencomposite-git";
    version = "effe0a8783937c5a3cfe7a72cf6f81152150b6cb";
    src = fetchgit {
      url = "https://gitlab.com/znixian/OpenOVR.git";
      rev = "effe0a8783937c5a3cfe7a72cf6f81152150b6cb";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-SV8E+4qu5J7MueHmdsdTDKNx4CH085fidgIJyewj8RQ=";
    };
    date = "2024-12-26";
  };
  picom = {
    pname = "picom";
    version = "v12.5";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "v12.5";
      fetchSubmodules = false;
      sha256 = "sha256-H8IbzzrzF1c63MXbw5mqoll3H+vgcSVpijrlSDNkc+o=";
    };
  };
  picom-git = {
    pname = "picom-git";
    version = "fcb4a2dc9c2ac9f50b087e4039fdc1ec5da119f5";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "fcb4a2dc9c2ac9f50b087e4039fdc1ec5da119f5";
      fetchSubmodules = false;
      sha256 = "sha256-RoRu6L63wm9jAszRkzMtaxwpR9iPWcrxdNaySLY0M9E=";
    };
    date = "2024-11-21";
  };
  picom-tag = {
    pname = "picom-tag";
    version = "v12.5";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "v12.5";
      fetchSubmodules = false;
      sha256 = "sha256-H8IbzzrzF1c63MXbw5mqoll3H+vgcSVpijrlSDNkc+o=";
    };
  };
  poepyautopot = {
    pname = "poepyautopot";
    version = "1.3.6";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "poepyautopot";
      rev = "1.3.6";
      fetchSubmodules = false;
      sha256 = "sha256-XCyDONNJQwDT1RzpDKkOOPYmo9gzZhwgxP37kScEVLA=";
    };
  };
  poepyautopot-git = {
    pname = "poepyautopot-git";
    version = "c63a7c2edbcffdb73a45e1ef88d4f4dde652595b";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "poepyautopot";
      rev = "c63a7c2edbcffdb73a45e1ef88d4f4dde652595b";
      fetchSubmodules = false;
      sha256 = "sha256-odcC4KTImfJMWxtn8xAqwTbalcvUuxTw/DivAjvhyUw=";
    };
    date = "2024-12-30";
  };
  tilp2-gfm = {
    pname = "tilp2-gfm";
    version = "1.18";
    src = fetchFromGitHub {
      owner = "debrouxl";
      repo = "tilp_and_gfm";
      rev = "1.18";
      fetchSubmodules = false;
      sha256 = "sha256-/XkxEfWzJiOkM5aoenp/GQSkkNg9qoXkFtcj/nenFEw=";
    };
  };
  tilp2-gfm-git = {
    pname = "tilp2-gfm-git";
    version = "0a525619a07d92734b5eb5ba1d47c56f4de37458";
    src = fetchFromGitHub {
      owner = "debrouxl";
      repo = "tilp_and_gfm";
      rev = "0a525619a07d92734b5eb5ba1d47c56f4de37458";
      fetchSubmodules = false;
      sha256 = "sha256-itPop4GO6ty40iucg31YgHEoK0W05eM+rD9tF+nAugE=";
    };
    date = "2024-12-01";
  };
  wivrn = {
    pname = "wivrn";
    version = "v0.22";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "v0.22";
      fetchSubmodules = false;
      sha256 = "sha256-i/CG+zD64cwnu0z1BRkRn7Wm67KszE+wZ5geeAvrvMY=";
    };
  };
  wivrn-git = {
    pname = "wivrn-git";
    version = "a434094055beef644e51b4cfbe530b182f459e19";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "a434094055beef644e51b4cfbe530b182f459e19";
      fetchSubmodules = false;
      sha256 = "sha256-GbE3OLAz6AhfwtscPlqnB5csTyJPs5Ps3pj7D+K420k=";
    };
    date = "2025-01-07";
  };
  wivrn-git-monado = {
    pname = "wivrn-git-monado";
    version = "e5f5461dff2d745b3abd19cd05785d815304b2c6";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "e5f5461dff2d745b3abd19cd05785d815304b2c6";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-dv6uubsngOhj4OX38ZMMYpw0ldWaLit990jNrlX2xLs=";
    };
  };
  wivrn-monado = {
    pname = "wivrn-monado";
    version = "aa2b0f9f1d638becd6bb9ca3c357ac2561a36b07";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "aa2b0f9f1d638becd6bb9ca3c357ac2561a36b07";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-yfHtkMvX/gyVG0UgpSB6KjSDdCym6Reb9LRb3OortaI=";
    };
  };
  xrizer = {
    pname = "xrizer";
    version = "v0.1";
    src = fetchFromGitHub {
      owner = "Supreeeme";
      repo = "xrizer";
      rev = "v0.1";
      fetchSubmodules = false;
      sha256 = "sha256-0szkc/EURm4N0gl+tSFhLeQTYPX7ZgBHXwpP11Ju8Ng=";
    };
  };
  xrizer-git = {
    pname = "xrizer-git";
    version = "fb71963e363e6646e316e77050772adbf6957369";
    src = fetchFromGitHub {
      owner = "Supreeeme";
      repo = "xrizer";
      rev = "fb71963e363e6646e316e77050772adbf6957369";
      fetchSubmodules = false;
      sha256 = "sha256-s53kzUPRlJZzifIzJzr4cH7QoOR3AWZ6rGuzmXtIzcY=";
    };
    date = "2025-01-04";
  };
}
