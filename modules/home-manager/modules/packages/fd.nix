{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.fd;
in {
  options.programs.fd = {
    enable = lib.mkEnableOption "A simple, fast and user-friendly alternative to find";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.fd];
  };
}
