{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fonts.nix
    ./homebrew.nix
  ];

  config = {
    nix.useDaemon = true;
    services.nix-daemon.enable = true;
    programs.fish.babelfishPackage = pkgs.babelfish;
    environment.loginShell = "/run/current-system/sw/bin/fish";
  };
}
