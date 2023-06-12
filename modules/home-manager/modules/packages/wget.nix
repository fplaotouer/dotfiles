{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.wget;
in {
  options.programs.wget = {
    enable = lib.mkEnableOption "GNU Wget2 is the successor of GNU Wget, a file and recursive website downloader";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.wget pkgs.wget2];
  };
}
