# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  alvr = {
    pname = "alvr";
    version = "v20.10.0";
    src = fetchFromGitHub {
      owner = "alvr-org";
      repo = "ALVR";
      rev = "v20.10.0";
      fetchSubmodules = false;
      sha256 = "sha256-1kguRVzGTqUh/LLh+u6MBuypGrK7aZ2ZO1ZimNcS9TE=";
    };
  };
  alvr-archive = {
    pname = "alvr-archive";
    version = "v20.10.0";
    src = fetchTarball {
      url = "https://github.com/alvr-org/ALVR/releases/download/v20.10.0/alvr_streamer_linux.tar.gz";
      sha256 = "sha256-9PS63eF+39yXztOvV+Z6LJt0K20EUy9/8H1GsA+e8Jg=";
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
    version = "a70acbe6d217d8a3f92285fb42b05f4fd41eb48d";
    src = fetchFromGitHub {
      owner = "WiVRn";
      repo = "WiVRn";
      rev = "a70acbe6d217d8a3f92285fb42b05f4fd41eb48d";
      fetchSubmodules = false;
      sha256 = "sha256-ThhxfxOssh9RIpcT+kS0jeYqF2Vrtavip1wLWcRYG58=";
    };
    date = "2024-09-04";
  };
}
