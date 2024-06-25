{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.ssh = {
    compression = true;
    serverAliveInterval = 30;
  };
}
