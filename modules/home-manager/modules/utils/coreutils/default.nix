{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.coreutils;
in {
  options.programs.coreutils = {
    enable = lib.mkEnableOption "The GNU Core Utilities are the basic file, shell and text manipulation utilities of the GNU operating system";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.coreutils];
  };
}
