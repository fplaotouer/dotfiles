{
  config,
  pkgs,
  ...
}: {
  programs = {
    helix.defaultEditor = true;
    neovim.lazyVim = false;
    fd.enable = true;
    lsd.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    neofetch.enable = true;
  };
}
