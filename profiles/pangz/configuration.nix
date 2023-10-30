{
  config,
  pkgs,
  ...
}: {
  homebrew = {
    enable = true;
    taps = [
    ];
    brews = [
      "subversion"
      "lux"
    ];
    casks = [
      "utm"
      "tencent-meeting"
      "duckduckgo"
      "netnewswire"
      "docker"
      "liberica-jdk8-full"
    ];
  };
}
