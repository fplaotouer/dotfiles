{
  lib,
  config,
  pkgs,
  ...
}: {
  programs = {
    helix.defaultEditor = true;
    neovim.lazyVim = false;
  };
}
