{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.taskwarrior;
in {
  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.taskwarrior-tui];
    programs = {
      fish = {
        shellAbbrs = {
          taskui = "taskwarrior-tui";
        };
      };
      taskwarrior = {
        package = pkgs.taskwarrior3;
        colorTheme = null;
        config = {};
      };
    };
  };
}
