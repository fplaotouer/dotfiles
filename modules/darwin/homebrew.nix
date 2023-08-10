{
  lib,
  config,
  pkgs,
  ...
}: let
  javaVersion = "17";
in {
  config = lib.mkIf (config.homebrew.enable) {
    environment.systemPath = lib.mkAfter [
      "${config.homebrew.brewPrefix}"
      # Java
      "/Library/Java/JavaVirtualMachines/liberica-jdk-${javaVersion}-full.jdk/Contents/Home/bin"
    ];
    environment.variables = {
      JAVA_HOME = "/Library/Java/JavaVirtualMachines/liberica-jdk-${javaVersion}-full.jdk/Contents/Home";
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
        "homebrew/core"
        "homebrew/cask"
        "homebrew/bundle"
        "homebrew/services"
        "homebrew/cask-versions"
        "bell-sw/liberica"
      ];
      brews = [
        "maven"
        "gradle"
        "ffmpeg"
      ];
      casks = [
        "appcleaner"
        "hiddenbar"
        "iina"
        "spotify"
        "liberica-jdk${javaVersion}-full"
        "kitty"
        "alacritty"
        "firefox-developer-edition"
        "telegram"
        # "signal"
        "mullvadvpn"
      ];
    };
  };
}
