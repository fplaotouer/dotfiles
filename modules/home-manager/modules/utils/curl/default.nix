{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.curl;
in {
  options.programs.curl = {
    enable = lib.mkEnableOption "Curl is a command-line tool for transferring data specified with URL syntax";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.curl];
  };
}
