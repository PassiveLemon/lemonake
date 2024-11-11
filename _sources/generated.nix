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
    version = "0.1.16-beta.2";
    src = fetchurl {
      url = "https://github.com/vrc-get/vrc-get/releases/download/gui-v0.1.16-beta.2/alcom-0.1.16-beta.2-x86_64.AppImage";
      sha256 = "sha256-in3Ci6p9LuGrRHwTVz7BmOY3cRNjNvV6tMXBasQ+cig=";
    };
  };
  alvr = {
    pname = "alvr";
    version = "v20.11.1";
    src = fetchFromGitHub {
      owner = "alvr-org";
      repo = "ALVR";
      rev = "v20.11.1";
      fetchSubmodules = false;
      sha256 = "sha256-boSS7eEfcKRJf5gt1LKk/DuyZEWMTun093P7mkIjUgs=";
    };
  };
  alvr-archive = {
    pname = "alvr-archive";
    version = "v20.11.1";
    src = fetchTarball {
      url = "https://github.com/alvr-org/ALVR/releases/download/v20.11.1/alvr_streamer_linux.tar.gz";
      sha256 = "sha256-/m5uyqI1qrWc82FSoU+baSzpvIGXOwjjJhObMeWPjfg=";
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
    version = "60d1ed307273f52836b768f287bcbba1e4c8d08c";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "hd2pystratmacro";
      rev = "60d1ed307273f52836b768f287bcbba1e4c8d08c";
      fetchSubmodules = false;
      sha256 = "sha256-aFlzDes59pYz0Cr7gOhZtz5qPz3fLuR6wkpn+Q4J/GQ=";
    };
    date = "2024-10-06";
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
    version = "e162c7e9be2521a357fba4bee13af85437a1027b";
    src = fetchgit {
      url = "https://gitlab.com/znixian/OpenOVR.git";
      rev = "e162c7e9be2521a357fba4bee13af85437a1027b";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-+suq0gV8zRDhF3ApnzQCC/5st59VniU6v7TcDdght6Q=";
    };
    date = "2024-10-28";
  };
  picom = {
    pname = "picom";
    version = "v12.3";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "v12.3";
      fetchSubmodules = false;
      sha256 = "sha256-FwjMlHP8xNJikkPpz+8BORrqqKYvRpkqm9GbExCoLAU=";
    };
  };
  picom-git = {
    pname = "picom-git";
    version = "4529db794c1f255b4c2de7acccf016b60f0a9151";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "4529db794c1f255b4c2de7acccf016b60f0a9151";
      fetchSubmodules = false;
      sha256 = "sha256-RzTbUzbI+JNPqfVWZr1edfYTayvxAc/abp6xHZje3uM=";
    };
    date = "2024-11-07";
  };
  picom-tag = {
    pname = "picom-tag";
    version = "v12.3";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "v12.3";
      fetchSubmodules = false;
      sha256 = "sha256-FwjMlHP8xNJikkPpz+8BORrqqKYvRpkqm9GbExCoLAU=";
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
    version = "2b124ab6029efb929dc7c249d7fd4ea3f01ff427";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "poepyautopot";
      rev = "2b124ab6029efb929dc7c249d7fd4ea3f01ff427";
      fetchSubmodules = false;
      sha256 = "sha256-TxQkQOeIVWsPx6+l71IRYxrnlysacSSAFttdHSsbN3g=";
    };
    date = "2024-10-06";
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
    version = "5a2ea6337c4983b80375a50e3ada1f7c45f6e9ea";
    src = fetchFromGitHub {
      owner = "debrouxl";
      repo = "tilp_and_gfm";
      rev = "5a2ea6337c4983b80375a50e3ada1f7c45f6e9ea";
      fetchSubmodules = false;
      sha256 = "sha256-sIwio294jvb21N0XTFhDGbd1uq/yFfgrxBRtMw+NVew=";
    };
    date = "2023-11-12";
  };
  wivrn = {
    pname = "wivrn";
    version = "v0.21.1";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "v0.21.1";
      fetchSubmodules = false;
      sha256 = "sha256-03KFVXD7/OTJi3sOHzTjYGLu5voUiz9YNqfO07rB7t4=";
    };
  };
  wivrn-git = {
    pname = "wivrn-git";
    version = "3147f4465da26fdbfe10e1e3ad81eb66fc09b3b7";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "3147f4465da26fdbfe10e1e3ad81eb66fc09b3b7";
      fetchSubmodules = false;
      sha256 = "sha256-5UYRtisFMwblg0yzcOD5pRGw80PHAO+TNB+6b0GtJtU=";
    };
    date = "2024-11-10";
  };
  wivrn-git-monado = {
    pname = "wivrn-git-monado";
    version = "8aea7b8691061bbc01c37808e3f3d55b47797fa6";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "8aea7b8691061bbc01c37808e3f3d55b47797fa6";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-8WAIzUyzSDuNrFqbrD2aqNiVfgh1qzBXO7rN4xGIMns=";
    };
  };
  wivrn-monado = {
    pname = "wivrn-monado";
    version = "cef70d03ca749225af0de57824270ad708bd828a";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "cef70d03ca749225af0de57824270ad708bd828a";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-w48Xb1YI8LIV2exHFSgCaTz2FonXYAa55RqlvfauGvk=";
    };
  };
}
