{lib, ...}: {
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
    systemPath = lib.mkAfter [
      # Java
      "/Library/Java/JavaVirtualMachines/liberica-jdk-21.jdk/Contents/Home/bin"
    ];
    variables = {
      # Java Home
      JAVA_HOME = "/Library/Java/JavaVirtualMachines/liberica-jdk-21.jdk/Contents/Home";
    };
  };

  homebrew = {
    enable = true;
    taps = [
      "bell-sw/liberica"
    ];
    brews = [
      "gradle"
      "maven"
    ];
    casks = [
      "jetbrains-toolbox"
      "the-unarchiver"
      "appcleaner"
      "iina"
      "zed"
      "liberica-jdk21"
      "docker-desktop"
      "tencent-meeting"
    ];
  };
}
