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
    age.enable = true;
    sops.enable = true;
    neovim.enable = true;
    fish.enable = true;
    ssh.enable = true;
    git.enable = true;
    gpg.enable = true;
    password-store.enable = true;
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
