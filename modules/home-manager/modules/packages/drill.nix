{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.drill;
in {
  options.programs.drill = {
    enable = lib.mkEnableOption "HTTP load testing application inspired by Ansible syntax";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.drill];
  };
}
