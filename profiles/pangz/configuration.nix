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
      "tencent-meeting"
      "docker"
      "liberica-jdk8-full"
    ];
  };
}
