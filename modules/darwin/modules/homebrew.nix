{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.homebrew.enable {
    environment = {
      systemPath = lib.mkAfter ["${config.homebrew.brewPrefix}"];
    };
    homebrew = {
      # Configuring the behavior of Homebrew commands when you manually invoke them
      global = {
        brewfile = true;
        # `lockfiles` default to `!config.homebrew.global.brewfile`
        lockfiles = false;
        autoUpdate = true;
      };
      # Configuring the behavior of the brew bundle command that nix-darwin runs during system activation
      onActivation = {
        cleanup = lib.mkDefault "zap";
        autoUpdate = false;
        upgrade = false;
      };
      casks = [
        "lulu"
      ];
    };
  };
}
