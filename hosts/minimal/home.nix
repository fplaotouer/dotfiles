{
  config,
  pkgs,
  ...
}: {
  programs = {
    neovim.defaultEditor = true;
    fd.enable = true;
    exa.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    neofetch.enable = true;
  };
}
