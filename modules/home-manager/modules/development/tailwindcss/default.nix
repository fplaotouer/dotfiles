{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.tailwindcss;
in {
  options.programs.tailwindcss = {
    enable = lib.mkEnableOption "Command-line tool for the CSS framework with composable CSS classes, standalone CLI";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = builtins.attrValues {
      inherit (pkgs) tailwindcss;
    };
  };
}
