{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.procs;
in {
  options.programs.procs = {
    enable = lib.mkEnableOption "A modern replacement for ps written in Rust";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.procs];
  };
}
