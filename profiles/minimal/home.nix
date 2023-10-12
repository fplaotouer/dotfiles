{
  lib,
  config,
  pkgs,
  ...
}: {
  nix.settings.substituters = lib.mkBefore ["https://mirrors.cernet.edu.cn/nix-channels/store"];
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
