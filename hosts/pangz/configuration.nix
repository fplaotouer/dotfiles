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
      "notion"
      "docker"
      "liberica-jdk8-full"
    ];
  };
}
