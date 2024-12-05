{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.ssh = {
    compression = true;
    serverAliveInterval = 30;
    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
      };
    };
  };
}
