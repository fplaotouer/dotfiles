{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.homebrew.enable) {
    environment = {
      systemPath = lib.mkAfter [
        "${config.homebrew.brewPrefix}"
        # Java
        "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin"
      ];
      variables = {
        # Java Home
        JAVA_HOME = "/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home";
      };
    };
    homebrew = {
      global = {
        brewfile = true;
        # `lockfiles` default to `!config.homebrew.global.brewfile`
        lockfiles = false;
        autoUpdate = true;
      };
      onActivation = {
        cleanup = "zap";
        autoUpdate = false;
        upgrade = false;
      };
      taps = [
        "homebrew/bundle"
        "homebrew/services"
      ];
      brews = [
      ];
      casks = [
        "appcleaner"
        "the-unarchiver"
        "vmware-fusion"
        "temurin@17"
        "jetbrains-toolbox"
        "alacritty"
        "chatgpt"
        "mullvadvpn@beta"
      ];
    };
  };
}
