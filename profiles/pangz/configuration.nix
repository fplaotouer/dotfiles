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
      "coursier/formulas"
      "bell-sw/liberica"
    ];
    brews = [
      "coursier"
      "maven"
      "gradle"
      "xmake"
    ];
    casks = [
      "docker"
      "tencent-docs"
      "tencent-meeting"
      "liberica-jdk8-full"
    ];
  };
}
