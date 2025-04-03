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
    version = "1.0.1";
    src = fetchurl {
      url = "https://github.com/vrc-get/vrc-get/releases/download/gui-v1.0.1/alcom-1.0.1-x86_64.AppImage";
      sha256 = "sha256-+AVz6ii/JxlNfb9CMPHEViwupzJ2bD+0UyEtdKgtsbg=";
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
    version = "2.0.24";
    src = fetchurl {
      url = "https://cdn-raw.gdl.gg/launcher/GDLauncher__2.0.24__linux__x64.AppImage";
      sha256 = "sha256-d5ZvWSLA/7mY0540TDLMW9qmEFA5xC6Zd83IWakOmGo=";
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
      sparseCheckout = [ ];
      sha256 = "sha256-QabYVKcenW+LQ+QSjUoQOLOQAVHdjE0YXd+1WsdzNPc=";
    };
    date = "2024-02-21";
  };
  opencomposite-git = {
    pname = "opencomposite-git";
    version = "aa25936e3884b0da5862280c7ec523e3f3e0c7ae";
    src = fetchgit {
      url = "https://gitlab.com/znixian/OpenOVR.git";
      rev = "aa25936e3884b0da5862280c7ec523e3f3e0c7ae";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-Xie1IdFLU1NJcK1rEdW/r7kgass4QyP32DTZ0w6a8DM=";
    };
    date = "2025-04-01";
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
    version = "b99537235bf858ccf527217bfc196d4923a3e3a1";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "b99537235bf858ccf527217bfc196d4923a3e3a1";
      fetchSubmodules = false;
      sha256 = "sha256-hHl20Sg2sYY0Jw8dHnIbEeG7DfqJE7oif1R3r6BNmaU=";
    };
    date = "2025-02-21";
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
  proton-ge-rtsp = {
    pname = "proton-ge-rtsp";
    version = "GE-Proton9-22-rtsp17";
    src = fetchTarball {
      url = "https://github.com/SpookySkeletons/proton-ge-rtsp/releases/download/GE-Proton9-22-rtsp17/GE-Proton9-22-rtsp17.tar.gz";
      sha256 = "sha256-1zj0y7E9JWrnPC9HllFXos33rsdAt3q+NamoxNTmHHM=";
    };
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
  vapor-git = {
    pname = "vapor-git";
    version = "e5a01bd34240534463b8353a9a342638239330b3";
    src = fetchFromGitHub {
      owner = "micheal65536";
      repo = "VapoR";
      rev = "e5a01bd34240534463b8353a9a342638239330b3";
      fetchSubmodules = false;
      sha256 = "sha256-rgqRcSxxcOhQ3qEY2vm+crNPpc3RuNkWdSIp0ex+TP0=";
    };
    date = "2025-03-11";
  };
  wayvr-dashboard = {
    pname = "wayvr-dashboard";
    version = "0.3.0";
    src = fetchFromGitHub {
      owner = "olekolek1000";
      repo = "wayvr-dashboard";
      rev = "0.3.0";
      fetchSubmodules = false;
      sha256 = "sha256-5313JDxAVGamgNYpgnGY7Q4M9VMSQYqKP9wjWg02D8Q=";
    };
    cargoLock."src-tauri/Cargo.lock" = {
      lockFile = ./wayvr-dashboard-0.3.0/src-tauri/Cargo.lock;
      outputHashes = {
        "keyvalues-parser-0.2.0" = "sha256-LT+WHhan/USzW0EOiuIBPG5j1r9qL4n7Z7ESDxO1xQQ=";
        "wayvr_ipc-0.1.0" = "sha256-ieQaY08Ogl/F3t/p825LBp1lAO3SWH1F8206IPXEgTc=";
        "libmonado-1.3.1" = "sha256-HYYfpYhyo5VmbUdwMTJuAR+2dnMITIGZIPGX9Qsnc/g=";
      };
    };
  };
  wayvr-dashboard-git = {
    pname = "wayvr-dashboard-git";
    version = "125900a3ca55a645ca297a216e52102452604cf9";
    src = fetchFromGitHub {
      owner = "olekolek1000";
      repo = "wayvr-dashboard";
      rev = "125900a3ca55a645ca297a216e52102452604cf9";
      fetchSubmodules = false;
      sha256 = "sha256-5313JDxAVGamgNYpgnGY7Q4M9VMSQYqKP9wjWg02D8Q=";
    };
    cargoLock."src-tauri/Cargo.lock" = {
      lockFile = ./wayvr-dashboard-git-125900a3ca55a645ca297a216e52102452604cf9/src-tauri/Cargo.lock;
      outputHashes = {
        "keyvalues-parser-0.2.0" = "sha256-LT+WHhan/USzW0EOiuIBPG5j1r9qL4n7Z7ESDxO1xQQ=";
        "wayvr_ipc-0.1.0" = "sha256-ieQaY08Ogl/F3t/p825LBp1lAO3SWH1F8206IPXEgTc=";
        "libmonado-1.3.1" = "sha256-HYYfpYhyo5VmbUdwMTJuAR+2dnMITIGZIPGX9Qsnc/g=";
      };
    };
    date = "2025-03-23";
  };
  webfisher = {
    pname = "webfisher";
    version = "0.4.1";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "webfisher";
      rev = "0.4.1";
      fetchSubmodules = false;
      sha256 = "sha256-Ik4DVQ735P7z8wUdchIjKCMiiAst5j1/eXuVPO1WQ+E=";
    };
  };
  webfisher-git = {
    pname = "webfisher-git";
    version = "2a384f9e174bf9e9674dfc7574f7a38f2c721990";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "webfisher";
      rev = "2a384f9e174bf9e9674dfc7574f7a38f2c721990";
      fetchSubmodules = false;
      sha256 = "sha256-Ik4DVQ735P7z8wUdchIjKCMiiAst5j1/eXuVPO1WQ+E=";
    };
    date = "2025-03-21";
  };
  wivrn = {
    pname = "wivrn";
    version = "v0.23.2";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "v0.23.2";
      fetchSubmodules = false;
      sha256 = "sha256-KpsS0XssSnE2Fj5rrXq1h+yNHhF7BzfPxwRUhZUZEaw=";
    };
  };
  wivrn-git = {
    pname = "wivrn-git";
    version = "9f26ad3cb91536c6f61a6ee859c9304a6487b7c4";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "9f26ad3cb91536c6f61a6ee859c9304a6487b7c4";
      fetchSubmodules = false;
      sha256 = "sha256-ykTafpX0XM+bwUOQmoUixOszeoSg0com4SsOuH8kTgk=";
    };
    date = "2025-04-01";
  };
  wivrn-git-monado = {
    pname = "wivrn-git-monado";
    version = "848a24aa106758fd6c7afcab6d95880c57dbe450";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "848a24aa106758fd6c7afcab6d95880c57dbe450";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-+rax9/CG/3y8rLYwGqoWJa4FxH+Z3eREiwhuxDOUzLs=";
    };
  };
  wivrn-monado = {
    pname = "wivrn-monado";
    version = "848a24aa106758fd6c7afcab6d95880c57dbe450";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "848a24aa106758fd6c7afcab6d95880c57dbe450";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-+rax9/CG/3y8rLYwGqoWJa4FxH+Z3eREiwhuxDOUzLs=";
    };
  };
  wlx-overlay-s = {
    pname = "wlx-overlay-s";
    version = "v25.3";
    src = fetchFromGitHub {
      owner = "galister";
      repo = "wlx-overlay-s";
      rev = "v25.3";
      fetchSubmodules = false;
      sha256 = "sha256-m2YVXF9bEjovZOWa+X1CYHAUaAsUI4dBMG2ni3jP9L4=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./wlx-overlay-s-v25.3/Cargo.lock;
      outputHashes = {
        "openxr-0.18.0" = "sha256-ktkbhmExstkNJDYM/HYOwAwv3acex7P9SP0KMAOKhQk=";
        "vulkano-0.34.0" = "sha256-0ZIxU2oItT35IFnS0YTVNmM775x21gXOvaahg/B9sj8=";
        "wlx-capture-0.4.2" = "sha256-uNOVG5EJ8ZBGvdBzq8XaS8agspj0Ko8dwPoYpLBM1UY=";
        "wayvr_ipc-0.1.0" = "sha256-ieQaY08Ogl/F3t/p825LBp1lAO3SWH1F8206IPXEgTc=";
        "libspa-0.8.0" = "sha256-Gub2F/Gwia8DjFqUsM8e4Yr2ff92AwrWrszsws3X3sM=";
        "ovr_overlay-0.0.0" = "sha256-NHzESKsghqI98pkQxEmcNkQ9lTfBsqR9/25msbryi6E=";
        "libmonado-1.3.1" = "sha256-8NA8DLfErX44LIXg5fi2xRDyJaofjpQfILQuu0oaIOQ=";
        "smithay-0.4.0" = "sha256-Z1AS2IsbUJVIRNowzmtZ7hq0AOgVkuVgDBS8f9dBMKQ=";
      };
    };
  };
  wlx-overlay-s-git = {
    pname = "wlx-overlay-s-git";
    version = "60bc8b986ef627b32d936170fcc99bd7c533d654";
    src = fetchFromGitHub {
      owner = "galister";
      repo = "wlx-overlay-s";
      rev = "60bc8b986ef627b32d936170fcc99bd7c533d654";
      fetchSubmodules = false;
      sha256 = "sha256-pQvIe4WW3pjQJDvBK6LNkew2l9k3y7m+YOsPgyHrbm8=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./wlx-overlay-s-git-60bc8b986ef627b32d936170fcc99bd7c533d654/Cargo.lock;
      outputHashes = {
        "openxr-0.18.0" = "sha256-ktkbhmExstkNJDYM/HYOwAwv3acex7P9SP0KMAOKhQk=";
        "vulkano-0.34.0" = "sha256-0ZIxU2oItT35IFnS0YTVNmM775x21gXOvaahg/B9sj8=";
        "wlx-capture-0.4.2" = "sha256-uNOVG5EJ8ZBGvdBzq8XaS8agspj0Ko8dwPoYpLBM1UY=";
        "wayvr_ipc-0.1.0" = "sha256-ieQaY08Ogl/F3t/p825LBp1lAO3SWH1F8206IPXEgTc=";
        "libspa-0.8.0" = "sha256-Gub2F/Gwia8DjFqUsM8e4Yr2ff92AwrWrszsws3X3sM=";
        "ovr_overlay-0.0.0" = "sha256-NHzESKsghqI98pkQxEmcNkQ9lTfBsqR9/25msbryi6E=";
        "libmonado-1.3.1" = "sha256-8NA8DLfErX44LIXg5fi2xRDyJaofjpQfILQuu0oaIOQ=";
      };
    };
    date = "2025-03-29";
  };
  xrizer = {
    pname = "xrizer";
    version = "v0.2";
    src = fetchFromGitHub {
      owner = "Supreeeme";
      repo = "xrizer";
      rev = "v0.2";
      fetchSubmodules = false;
      sha256 = "sha256-0RICNxF8RBHthve69Z9msTg2+jegg5K4aHYRF0YZ8a4=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./xrizer-v0.2/Cargo.lock;
      outputHashes = {
        "openxr-0.19.0" = "sha256-mljVBbQTq/k7zd/WcE1Sd3gibaJiZ+t7td964clWHd8=";
      };
    };
  };
  xrizer-git = {
    pname = "xrizer-git";
    version = "2ba2c4f2b9592e821e387d2840975a22db5c413f";
    src = fetchFromGitHub {
      owner = "Supreeeme";
      repo = "xrizer";
      rev = "2ba2c4f2b9592e821e387d2840975a22db5c413f";
      fetchSubmodules = false;
      sha256 = "sha256-gsOgvlh8xOOh9nk4mn/KXAXXqHuYfm5yHBELYakaWlQ=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./xrizer-git-2ba2c4f2b9592e821e387d2840975a22db5c413f/Cargo.lock;
      outputHashes = {
        "openxr-0.19.0" = "sha256-mljVBbQTq/k7zd/WcE1Sd3gibaJiZ+t7td964clWHd8=";
      };
    };
    date = "2025-04-02";
  };
}
