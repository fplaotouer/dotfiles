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
    programs.fish.shellAbbrs = {
      taskui = "taskwarrior-tui";
    };
    programs.taskwarrior = {
      colorTheme = null;
      config = {};
    };
  };
}
