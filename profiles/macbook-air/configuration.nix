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
      "/Library/Java/JavaVirtualMachines/graalvm-17.jdk/Contents/Home/bin"
    ];
    variables = {
      # Java Home
      JAVA_HOME = "/Library/Java/JavaVirtualMachines/graalvm-17.jdk/Contents/Home";
    };
  };

  homebrew = {
    enable = true;
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
      "graalvm-jdk@17"
      "tencent-meeting"
    ];
  };
}
