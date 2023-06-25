{
  config,
  pkgs,
  ...
}: {
  programs = {
    neovim.defaultEditor = true;
    exa.enable = true;
    direnv.enable = true;
    starship.enable = true;
    neofetch.enable = true;
  };
}
