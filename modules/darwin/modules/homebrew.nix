{lib, ...}: {
  homebrew = {
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    # Configuring the behavior of Homebrew commands when you manually invoke them
    global = {
      brewfile = true;
      autoUpdate = true;
    };
    # Configuring the behavior of the brew bundle command that nix-darwin runs during system activation
    onActivation = {
      cleanup = lib.mkDefault "zap";
      autoUpdate = false;
      upgrade = false;
    };
    casks = [
      "ghostty"
      "lulu"
    ];
  };
}
