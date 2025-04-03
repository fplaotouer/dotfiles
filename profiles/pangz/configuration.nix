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
      "tencent-docs"
      "tencent-meeting"
      "liberica-jdk8-full"
      "appcleaner"
      "temurin@17"
      "vmware-fusion"
      "mullvad-browser"
      "jetbrains-toolbox"
    ];
  };
}
