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
  };
}
