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
    version = "2.0.22";
    src = fetchurl {
      url = "https://cdn-raw.gdl.gg/launcher/GDLauncher__2.0.22__linux__x64.AppImage";
      sha256 = "sha256-b1d39cSuVJ17rx8vjlYlyIUvqkBbhCWXuq4Z96K1I3M=";
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
    version = "175e3b3a5408ff120bd21036faa703deb57159fc";
    src = fetchgit {
      url = "https://gitlab.com/znixian/OpenOVR.git";
      rev = "175e3b3a5408ff120bd21036faa703deb57159fc";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-kwu8eM/rQBcZfs91loh7QAB46a01F9n5Xm1DmMd53MQ=";
    };
    date = "2025-02-08";
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
    version = "38d2c4a4ed263e10e868a1f86efc89fab6a36a30";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "38d2c4a4ed263e10e868a1f86efc89fab6a36a30";
      fetchSubmodules = false;
      sha256 = "sha256-UV63ajJX8YL0JZOcltoD8AgMMK3Fbt18LlhSxCgjPAQ=";
    };
    date = "2025-02-14";
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
    version = "a20012c826b17293266c10df5ab9af86697a75db";
    src = fetchFromGitHub {
      owner = "micheal65536";
      repo = "VapoR";
      rev = "a20012c826b17293266c10df5ab9af86697a75db";
      fetchSubmodules = false;
      sha256 = "sha256-1rYEs0akbrewBFD9PJ0FmyxjelR5RXorNGWnCE9gc7g=";
    };
    date = "2025-02-01";
  };
  wayvr-dashboard-git = {
    pname = "wayvr-dashboard-git";
    version = "9246f42ddb00301fbc46d3c2999736894b2ae615";
    src = fetchFromGitHub {
      owner = "olekolek1000";
      repo = "wayvr-dashboard";
      rev = "9246f42ddb00301fbc46d3c2999736894b2ae615";
      fetchSubmodules = false;
      sha256 = "sha256-EPpa6uJcim0DfgucxXEEQjqVyFDQUeoKZMsz7X6as0g=";
    };
    cargoLock."src-tauri/Cargo.lock" = {
      lockFile = ./wayvr-dashboard-git-9246f42ddb00301fbc46d3c2999736894b2ae615/src-tauri/Cargo.lock;
      outputHashes = {
        "keyvalues-parser-0.2.0" = "sha256-zbpgA6q2mIfFN6RoM0tauIQQFWT091TZ+6CCnBcYLa0=";
        "wayvr_ipc-0.1.0" = "sha256-o224e306Y0Rlmkci/jBQwCNsgeI7jlOpRkLuVveQP2E=";
      };
    };
    date = "2025-02-14";
  };
  webfisher = {
    pname = "webfisher";
    version = "0.4.0";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "webfisher";
      rev = "0.4.0";
      fetchSubmodules = false;
      sha256 = "sha256-Dh9gtOrcK3UVd7DdKhOIUHObfRWrJ5WQl+16w+8LvAw=";
    };
  };
  webfisher-git = {
    pname = "webfisher-git";
    version = "114afae7c82eca264eb5ad0dd9409ff92207c463";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "webfisher";
      rev = "114afae7c82eca264eb5ad0dd9409ff92207c463";
      fetchSubmodules = false;
      sha256 = "sha256-Dh9gtOrcK3UVd7DdKhOIUHObfRWrJ5WQl+16w+8LvAw=";
    };
    date = "2025-01-27";
  };
  wivrn = {
    pname = "wivrn";
    version = "v0.23.1";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "v0.23.1";
      fetchSubmodules = false;
      sha256 = "sha256-s/CPMZ89Rt9moTWsKBVxDMCRvW9V7CPh7cBEEf/iTpE=";
    };
  };
  wivrn-git = {
    pname = "wivrn-git";
    version = "3817dd43630c6a00bffc65a087fc3b8be47d8def";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "3817dd43630c6a00bffc65a087fc3b8be47d8def";
      fetchSubmodules = false;
      sha256 = "sha256-KpsS0XssSnE2Fj5rrXq1h+yNHhF7BzfPxwRUhZUZEaw=";
    };
    date = "2025-02-15";
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
    version = "v0.6";
    src = fetchFromGitHub {
      owner = "galister";
      repo = "wlx-overlay-s";
      rev = "v0.6";
      fetchSubmodules = false;
      sha256 = "sha256-Gk/3m4eWFZqeQBphBUTGAUqe8SspXqut8n4JM8tTe6o=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./wlx-overlay-s-v0.6/Cargo.lock;
      outputHashes = {
        "openxr-0.18.0" = "sha256-ktkbhmExstkNJDYM/HYOwAwv3acex7P9SP0KMAOKhQk=";
        "libmonado-rs-0.1.0" = "sha256-ja7OW/YSmfzaQoBhu6tec9v8fyNDknLekE2eY7McLPE=";
        "vulkano-0.34.0" = "sha256-0ZIxU2oItT35IFnS0YTVNmM775x21gXOvaahg/B9sj8=";
        "ovr_overlay-0.0.0" = "sha256-5IMEI0IPTacbA/1gibYU7OT6r+Bj+hlQjDZ3Kg0L2gw=";
        "wlx-capture-0.3.12" = "sha256-32WnAnNUSfsAA8WB9da3Wqb4acVlXh6HWsY9tPzCHEE=";
      };
    };
  };
  wlx-overlay-s-git = {
    pname = "wlx-overlay-s-git";
    version = "965174c7812274915f175d92a503f7ea9cd1468d";
    src = fetchFromGitHub {
      owner = "galister";
      repo = "wlx-overlay-s";
      rev = "965174c7812274915f175d92a503f7ea9cd1468d";
      fetchSubmodules = false;
      sha256 = "sha256-uoKeWNwEKvmRAqhVEDl44zCg9Do4Ll3/SjKq8oPfmSI=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./wlx-overlay-s-git-965174c7812274915f175d92a503f7ea9cd1468d/Cargo.lock;
      outputHashes = {
        "openxr-0.18.0" = "sha256-ktkbhmExstkNJDYM/HYOwAwv3acex7P9SP0KMAOKhQk=";
        "libmonado-rs-0.1.0" = "sha256-ja7OW/YSmfzaQoBhu6tec9v8fyNDknLekE2eY7McLPE=";
        "vulkano-0.34.0" = "sha256-0ZIxU2oItT35IFnS0YTVNmM775x21gXOvaahg/B9sj8=";
        "wlx-capture-0.4.2" = "sha256-uNOVG5EJ8ZBGvdBzq8XaS8agspj0Ko8dwPoYpLBM1UY=";
        "smithay-0.3.0" = "sha256-Njw+deqcmUaR4iAmXZEzRTyNR2ZP+tshAGk0f6/CdAg=";
        "wayvr_ipc-0.1.0" = "sha256-o224e306Y0Rlmkci/jBQwCNsgeI7jlOpRkLuVveQP2E=";
        "libspa-0.8.0" = "sha256-Gub2F/Gwia8DjFqUsM8e4Yr2ff92AwrWrszsws3X3sM=";
        "ovr_overlay-0.0.0" = "sha256-5IMEI0IPTacbA/1gibYU7OT6r+Bj+hlQjDZ3Kg0L2gw=";
      };
    };
    date = "2025-02-12";
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
    cargoLock."Cargo.lock" = {
      lockFile = ./xrizer-v0.1/Cargo.lock;
      outputHashes = {
        "openxr-0.19.0" = "sha256-mljVBbQTq/k7zd/WcE1Sd3gibaJiZ+t7td964clWHd8=";
      };
    };
  };
  xrizer-git = {
    pname = "xrizer-git";
    version = "1707a51c5097d189f4b787305fa745b3ad8dfd64";
    src = fetchFromGitHub {
      owner = "Supreeeme";
      repo = "xrizer";
      rev = "1707a51c5097d189f4b787305fa745b3ad8dfd64";
      fetchSubmodules = false;
      sha256 = "sha256-qpn1qdzbCqgqd3P/H3AKmZpXnsvKgeZL5Jvscu0qwJ4=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./xrizer-git-1707a51c5097d189f4b787305fa745b3ad8dfd64/Cargo.lock;
      outputHashes = {
        "openxr-0.19.0" = "sha256-mljVBbQTq/k7zd/WcE1Sd3gibaJiZ+t7td964clWHd8=";
      };
    };
    date = "2025-02-15";
  };
}
