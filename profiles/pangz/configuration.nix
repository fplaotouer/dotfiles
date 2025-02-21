{
  lib,
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = builtins.attrValues {
      inherit
        (pkgs)
        ;
    };
  };

  homebrew = {
    enable = true;
    taps = [
      "bell-sw/liberica"
    ];
    brews = [
      "maven"
      "gradle"
      "xmake"
    ];
    casks = [
      "bilibili"
      "docker"
      "mullvad-browser"
      "tencent-docs"
      "tencent-meeting"
      "liberica-jdk8-full"
    ];
  };
}
