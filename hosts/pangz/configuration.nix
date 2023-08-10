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
      "libreoffice"
      "tencent-meeting"
      "duckduckgo"
      "docker"
      "liberica-jdk8-full"
    ];
  };
}
