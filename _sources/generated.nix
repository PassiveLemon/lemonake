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
    version = "e664f625e07a8249fb0e4f9dab179e47f3596d46";
    src = fetchgit {
      url = "https://gitlab.com/znixian/OpenOVR.git";
      rev = "e664f625e07a8249fb0e4f9dab179e47f3596d46";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-qykGfzlgEI3odLZTnnnk1NKHGBeYoM9yk2xtFTZkA+8=";
    };
    date = "2024-10-10";
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
    version = "16486739fa9daa5964e1bba5baa551da622999d7";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "16486739fa9daa5964e1bba5baa551da622999d7";
      fetchSubmodules = false;
      sha256 = "sha256-T79wLg1YjsXRSBUVaE4WAP8rwdeH9B0/c3m9QL2fYFA=";
    };
    date = "2024-10-18";
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
    version = "v0.20";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "v0.20";
      fetchSubmodules = false;
      sha256 = "sha256-mxvfwp/9CUoc6tU3KW257qlpXEZu7tK33jxn1TjAZYc=";
    };
  };
  wivrn-git = {
    pname = "wivrn-git";
    version = "702a9e732cfce045017e5821f75aaba4e2f5162e";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "702a9e732cfce045017e5821f75aaba4e2f5162e";
      fetchSubmodules = false;
      sha256 = "sha256-Queo2LSBw7zmQHkrAK9n/XRndCjrfK+TgAxrjbXbJtY=";
    };
    date = "2024-10-15";
  };
  wivrn-git-monado = {
    pname = "wivrn-git-monado";
    version = "d7089f182b0514e13554e99512d63e69c30523c5";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "d7089f182b0514e13554e99512d63e69c30523c5";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-5+8cFDQ2ptaBIJMdZ6gyb0GSL8vBaZktbuBnRlTWOmg=";
    };
  };
  wivrn-monado = {
    pname = "wivrn-monado";
    version = "d7089f182b0514e13554e99512d63e69c30523c5";
    src = fetchgit {
      url = "https://gitlab.freedesktop.org/monado/monado.git";
      rev = "d7089f182b0514e13554e99512d63e69c30523c5";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-5+8cFDQ2ptaBIJMdZ6gyb0GSL8vBaZktbuBnRlTWOmg=";
    };
  };
}
