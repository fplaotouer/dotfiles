{
  lib,
  pkgs,
  ...
}: {
  imports = let
    inherit (builtins) readDir attrNames filter map;
    paths = attrNames (readDir ./.);
    modules = filter (name: name != "default.nix") paths;
  in
    map (name: ./. + "/${name}") modules;

  xdg = {
    enable = true;
    stateFile = {
      ".keep".text = "";
    };
  };

  programs = {
    # Configurations
    zed-editor.enable = true;
    ghostty.enable = true;
    # Essential Tools
    fastfetch.enable = true;
    wget.enable = true;
    less.enable = true;
    fzf.enable = true;
    jq.enable = true;
    sd.enable = true;
    fd.enable = true;
    bat.enable = true;
    lsd.enable = true;
    yazi.enable = true;
    icdiff.enable = true;
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
    password-store.enable = true;
    # home-manager
    home-manager.enable = true;
  };

  home = {
    username = lib.mkDefault (import ./../../../users/pangz/pangz.nix {inherit pkgs;}).home.username;
    homeDirectory = lib.mkDefault (import ./../../../users/pangz/pangz.nix {inherit pkgs;}).home.homeDirectory;
    sessionPath = ["$HOME/.local/bin"];
    language.base = "en_US.UTF-8";
    stateVersion = lib.mkDefault "25.05";
    enableNixpkgsReleaseCheck = true;
    extraOutputsToInstall = [
      "doc"
      "info"
      "devdoc"
    ];
  };
}
