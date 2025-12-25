{
  lib,
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
        iina
        appcleaner
        the-unarchiver
        ;
    };
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
      "xmake"
      "gradle"
      "maven"
    ];
    casks = [
      "jetbrains-toolbox"
      "graalvm-jdk@17"
      "tencent-meeting"
    ];
  };
}
