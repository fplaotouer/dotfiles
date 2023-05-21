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

  config = lib.mkIf (pkgs.stdenv.isDarwin) {
    nix.useDaemon = true;
    services.nix-daemon.enable = true;
    environment.loginShell = "/run/current-system/sw/bin/fish";
  };
}
