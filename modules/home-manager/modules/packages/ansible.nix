{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.ansible;
in {
  options.programs.ansible = {
    enable = lib.mkEnableOption "Radically simple IT automation";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.ansible pkgs.ansible-lint pkgs.ansible-navigator];
    home.sessionVariables = {
      ANSIBLE_HOME = "${config.xdg.dataHome}/ansible";
    };
  };
}
