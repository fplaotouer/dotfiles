{
  lib,
  config,
  pkgs,
  ...
}: {
  environment.systemPath = lib.mkAfter [
    # Java
    "/Library/Java/JavaVirtualMachines/liberica-jdk-17-full.jdk/Contents/Home/bin"
  ];
  environment.variables = {
    JAVA_HOME = "/Library/Java/JavaVirtualMachines/liberica-jdk-17-full.jdk/Contents/Home";
  };
  homebrew = {
    enable = true;
    taps = [
      "coursier/formulas"
      "bell-sw/liberica"
    ];
    brews = [
      "lux"
      "coursier"
      "maven"
      "gradle"
      "xmake"
      "cmake"
      "ninja"
    ];
    casks = [
      "tencent-docs"
      "tencent-meeting"
      "liberica-jdk8-full"
      "liberica-jdk17-full"
    ];
  };
}
