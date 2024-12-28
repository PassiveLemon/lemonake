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
    version = "1.0.0-rc.1";
    src = fetchurl {
      url = "https://github.com/vrc-get/vrc-get/releases/download/gui-v1.0.0-rc.1/alcom-1.0.0-rc.1-x86_64.AppImage";
      sha256 = "sha256-hjjE+B/nyRPnfgyUa+Vax0cb79/7tLSs8gtWsUMpgsI=";
    };
  };
  alvr = {
    pname = "alvr";
    version = "v20.11.1";
    src = fetchFromGitHub {
      owner = "alvr-org";
      repo = "ALVR";
      rev = "v20.11.1";
      fetchSubmodules = true;
      sha256 = "sha256-d4KldPii8W1HcfnMSD8Fn+IGO/a3r8747APPjRCnbe8=";
    };
  };
  alvr-git = {
    pname = "alvr-git";
    version = "7ece87b1cf56c9a5dd3dbd5ed913a80b1766e508";
    src = fetchFromGitHub {
      owner = "alvr-org";
      repo = "ALVR";
      rev = "7ece87b1cf56c9a5dd3dbd5ed913a80b1766e508";
      fetchSubmodules = true;
      sha256 = "sha256-0+sqpjYEfHIUtfBaKeZ4FeTrx68tXk/cL8ccElTbsx4=";
    };
    date = "2024-12-27";
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
    version = "effe0a8783937c5a3cfe7a72cf6f81152150b6cb";
    src = fetchgit {
      url = "https://gitlab.com/znixian/OpenOVR.git";
      rev = "effe0a8783937c5a3cfe7a72cf6f81152150b6cb";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
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
    version = "203cea18c9f91e1e725f04eb5d725538d799a9a5";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "203cea18c9f91e1e725f04eb5d725538d799a9a5";
      fetchSubmodules = false;
      sha256 = "sha256-TtMPHllaIRnmnge2p9cXMj2Q/+YCP8rSjvY5EZgkaNQ=";
    };
    date = "2024-12-23";
  };
  wivrn-git-monado = {
    pname = "wivrn-git-monado";
    version = "aa2b0f9f1d638becd6bb9ca3c357ac2561a36b07";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "aa2b0f9f1d638becd6bb9ca3c357ac2561a36b07";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-yfHtkMvX/gyVG0UgpSB6KjSDdCym6Reb9LRb3OortaI=";
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
      sparseCheckout = [ ];
      sha256 = "sha256-yfHtkMvX/gyVG0UgpSB6KjSDdCym6Reb9LRb3OortaI=";
    };
  };
}
