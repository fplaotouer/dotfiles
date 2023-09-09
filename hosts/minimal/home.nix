{
  config,
  pkgs,
  ...
}: {
  programs = {
    neovim.defaultEditor = true;
    fd.enable = true;
    lsd.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    neofetch.enable = true;
  };
}
