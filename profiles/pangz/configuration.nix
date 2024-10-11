{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPath = lib.mkAfter [
    # Java
    "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin"
  ];
  environment.variables = {
    JAVA_HOME = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home";
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
