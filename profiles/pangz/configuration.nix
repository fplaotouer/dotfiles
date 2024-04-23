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
      "surrealdb/tap"
      "coursier/formulas"
      "bell-sw/liberica"
    ];
    brews = [
      "subversion"
      "lux"
      "surreal"
      "coursier"
      "maven"
      "gradle"
      "cmake-docs"
      "cmake"
      "ninja"
      "xmake"
    ];
    casks = [
      "tencent-meeting"
      "docker"
      "liberica-jdk8-full"
      "liberica-jdk17-full"
    ];
  };
}
