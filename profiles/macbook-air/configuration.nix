{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/darwin
    ./hardware-configuration.nix
    ./../../users/pangz
  ];

  home-manager.users.pangz = {
    imports = [./home.nix];
  };
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
      "xmake"
      "gradle"
      "maven"
    ];
    casks = [
      "mullvad-browser"
      "jetbrains-toolbox"
      "temurin@17"
      "the-unarchiver"
      "appcleaner"
      "iina"
      "docker"
      "tencent-meeting"
      "liberica-jdk8-full"
      "bilibili"
    ];
  };
}
