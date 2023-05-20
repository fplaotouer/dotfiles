{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.usql;
in {
  options.programs.usql = {
    enable = lib.mkEnableOption "Universal command-line interface for SQL databases";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.usql];

    home.sessionVariables = {
      USQLRC = "${config.xdg.configHome}/usql/usqlrc";
    };
    xdg.configFile."usql/usqlrc".text = ''
      \set PAGER 'less'
      \x auto
    '';
  };
}
