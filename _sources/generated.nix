# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
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
    version = "e4b8a2e90aa7e94680cee23fcb429ec43fd07470";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "hd2pystratmacro";
      rev = "e4b8a2e90aa7e94680cee23fcb429ec43fd07470";
      fetchSubmodules = false;
      sha256 = "sha256-O2m+FLGmNadou6+/5qzPbxOgJC1MT48BDkTS29E7TO0=";
    };
    date = "2024-05-18";
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
    version = "09e2b33669eade2a9bc83fcc10b68cecbf474bca";
    src = fetchgit {
      url = "https://gitlab.com/znixian/OpenOVR.git";
      rev = "09e2b33669eade2a9bc83fcc10b68cecbf474bca";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-e8XD1AOswqH3YK2l7tJmGthgOkDALqI2LoZu5a7x1ow=";
    };
    date = "2024-09-29";
  };
  picom = {
    pname = "picom";
    version = "v12.1";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "v12.1";
      fetchSubmodules = false;
      sha256 = "sha256-XBFSPSrG6C4n5oQUQbWXyy9iCuEdrdaxU0CPR73juzk=";
    };
  };
  picom-git = {
    pname = "picom-git";
    version = "5c4f11008cd4a371f7ab7b6431b99a7f36a92134";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "5c4f11008cd4a371f7ab7b6431b99a7f36a92134";
      fetchSubmodules = false;
      sha256 = "sha256-jp3DAa08Nz3LbJl58waBAmK/uejmgQbH6iziEXFc5e0=";
    };
    date = "2024-09-29";
  };
  picom-tag = {
    pname = "picom-tag";
    version = "v12.1";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "v12.1";
      fetchSubmodules = false;
      sha256 = "sha256-XBFSPSrG6C4n5oQUQbWXyy9iCuEdrdaxU0CPR73juzk=";
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
    version = "c0bff056ee6b7be698104b996e77a32e8c89fded";
    src = fetchFromGitHub {
      owner = "PassiveLemon";
      repo = "poepyautopot";
      rev = "c0bff056ee6b7be698104b996e77a32e8c89fded";
      fetchSubmodules = false;
      sha256 = "sha256-m8c3UwrLshlKsHM5xbJUCBCkC+QKBU4E7XJcequ1w5s=";
    };
    date = "2024-05-18";
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
    version = "v0.19.1";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "v0.19.1";
      fetchSubmodules = false;
      sha256 = "sha256-ZSVn0k1ACm5Zm4TuGZih2R/l4jXtAnt2bLJmGw/kPZk=";
    };
  };
  wivrn-git = {
    pname = "wivrn-git";
    version = "56da7af334cfe98642b0184c8872c359e9501cef";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "56da7af334cfe98642b0184c8872c359e9501cef";
      fetchSubmodules = false;
      sha256 = "sha256-5J9pkNPWfn8S5mNjI5/Ts1Ea6VnbXuLj8Cjn8CEhXVM=";
    };
    date = "2024-09-27";
  };
  wivrn-git-monado = {
    pname = "wivrn-git-monado";
    version = "01806a3ffa62a2440da83d94e7a9297645d9d95a";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "01806a3ffa62a2440da83d94e7a9297645d9d95a";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-FDWBaT6QaeYZozWHK8c5+GBC+2qQyfUstM+ANt+8POU=";
    };
  };
  wivrn-monado = {
    pname = "wivrn-monado";
    version = "bcbe19ddd795f182df42051e5495e9727db36c1c";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "bcbe19ddd795f182df42051e5495e9727db36c1c";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-sh5slHROcuC3Dgenu1+hm8U5lUOW48JUbiluYvc3NiQ=";
    };
  };
}
