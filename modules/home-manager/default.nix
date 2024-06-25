{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../nix
    ./../nixpkgs
    ./modules
  ];

  xdg.enable = true;

  programs = {
    # Essential Tools
    less.enable = true;
    jq.enable = true;
    sd.enable = true;
    fd.enable = true;
    bat.enable = true;
    lsd.enable = true;
    bottom.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    # Editors
    helix.enable = true;
    neovim.enable = true;
    # Shells
    starship.enable = true;
    zsh.enable = true;
    bash.enable = true;
    fish.enable = true;
    # Utilities
    ssh.enable = true;
    git.enable = true;
    gpg.enable = true;
    curl.enable = true;
    # home-manager
    home-manager.enable = true;
  };

  home = {
    file = {
      "${config.xdg.stateHome}/.keep".text = "";
    };
    language.base = "en_US.UTF-8";
    stateVersion = "22.11";
    enableNixpkgsReleaseCheck = true;
    extraOutputsToInstall = [
      "doc"
      "info"
      "devdoc"
    ];
  };
}
