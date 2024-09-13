# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  alvr = {
    pname = "alvr";
    version = "v20.11.0";
    src = fetchFromGitHub {
      owner = "alvr-org";
      repo = "ALVR";
      rev = "v20.11.0";
      fetchSubmodules = false;
      sha256 = "sha256-niayCDmBW1W8zC6Hs+n0BN6p3MvsaPGdta5sJrZAccI=";
    };
  };
  alvr-archive = {
    pname = "alvr-archive";
    version = "v20.11.0";
    src = fetchTarball {
      url = "https://github.com/alvr-org/ALVR/releases/download/v20.11.0/alvr_streamer_linux.tar.gz";
      sha256 = "sha256-GfoXYzW3TUgpM5TXuHmsfhE9rP2M8iJpflF48tpmwIs=";
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
    version = "v0.18";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "v0.18";
      fetchSubmodules = false;
      sha256 = "sha256-JFiDjx2iQfBDD1yRWHPx0UiIAqEk8+nzf967o/HXYqs=";
    };
  };
  wivrn-git = {
    pname = "wivrn-git";
    version = "44f48abf8a0580c75dfdc351d73d8891b3d8d21b";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "44f48abf8a0580c75dfdc351d73d8891b3d8d21b";
      fetchSubmodules = false;
      sha256 = "sha256-Xgpk1qsW8rlc7bhuOVrhtpjB8wUx2mRCHcCpwio/pPA=";
    };
    date = "2024-09-12";
  };
  wivrn-git-monado = {
    pname = "wivrn-git-monado";
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
  wivrn-monado = {
    pname = "wivrn-monado";
    version = "dfc602288ab05131584a3f2be18031a13fccd061";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "dfc602288ab05131584a3f2be18031a13fccd061";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-4HZs3cgqOWWpXQb5kfG513f7+znO0hJvAbj2rxrqmeI=";
    };
  };
}
