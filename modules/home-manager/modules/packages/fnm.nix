{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.fnm;
in {
  options.programs.fnm = {
    enable = lib.mkEnableOption "Fast and simple Node.js version manager";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.fnm];
    xdg.configFile."fish/conf.d/fnm.fish".text = ''
      fnm env --use-on-cd --shell fish | source
    '';
  };
}
