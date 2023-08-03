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
      "duckduckgo"
      "docker"
      "liberica-jdk8-full"
    ];
  };
}
