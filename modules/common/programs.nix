{...}: {
  programs = {
    bash = {
      enable = true;
      completion.enable = true;
    };
    fish = {
      enable = true;
      useBabelfish = true;
    };
    zsh = {
      enable = true;
    };
  };
}
