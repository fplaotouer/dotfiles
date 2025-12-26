{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.sshpass;
in {
  options.programs.sshpass = {
    enable = lib.mkEnableOption "Simple and flexible tool for managing secrets";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.sshpass];
  };
}
