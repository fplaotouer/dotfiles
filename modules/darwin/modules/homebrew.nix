{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf (config.homebrew.enable) {
    environment = {
      systemPath = lib.mkAfter ["${config.homebrew.brewPrefix}"];
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
      casks = [
        "alacritty"
        "iina"
        "the-unarchiver"
        "mullvadvpn@beta"
      ];
    };
  };
}
