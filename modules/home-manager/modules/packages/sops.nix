{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.sops;
in {
  options.programs.sops = {
    enable = lib.mkEnableOption "Simple and flexible tool for managing secrets";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.sops];
  };
}
