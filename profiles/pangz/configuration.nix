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
        xmake
        ;
    };
    systemPath = lib.mkAfter [
      # Java
      "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin"
    ];
    variables = {
      # Java Home
      JAVA_HOME = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home";
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
    ];
    casks = [
      "docker"
      "tencent-docs"
      "tencent-meeting"
      "liberica-jdk8-full"
      "temurin@17"
    ];
  };
}
