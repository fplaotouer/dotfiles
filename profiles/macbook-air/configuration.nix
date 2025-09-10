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
  system.primaryUser = "pangz";

  environment = {
    systemPackages = builtins.attrValues {
      inherit
        (pkgs)
        ;
    };
    systemPath = lib.mkAfter [
      # Java
      "/Library/Java/JavaVirtualMachines/liberica-jdk-17-full.jdk/Contents/Home/bin"
    ];
    variables = {
      # Java Home
      JAVA_HOME = "/Library/Java/JavaVirtualMachines/liberica-jdk-17-full.jdk/Contents/Home";
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
      "liberica-jdk17-full"
      "the-unarchiver"
      "appcleaner"
      "iina"
      "tencent-meeting"
      "liberica-jdk8-full"
      "bilibili"
    ];
  };
}
