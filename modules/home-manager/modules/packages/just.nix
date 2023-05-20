{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.just-cli;
in {
  options.programs.just-cli = {
    enable = lib.mkEnableOption "just is a handy way to save and run project-specific commands.";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.just];
  };
}
