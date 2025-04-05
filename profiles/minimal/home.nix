{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/home-manager
    ./../../users/pangz/pangz.nix
  ];

  programs = {
    helix.defaultEditor = true;
    neovim.lazyVim = false;
  };
}
