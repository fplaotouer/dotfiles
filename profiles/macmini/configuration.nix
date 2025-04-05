{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../../modules/darwin
    ./hardware-configuration.nix
    ./../../users/pangz
  ];

  home-manager.users.pangz = {
    imports = [./home.nix];
  };

  homebrew = {
    enable = true;
  };
}
