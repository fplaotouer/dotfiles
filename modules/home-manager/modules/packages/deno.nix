{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.deno;
in {
  options.programs.deno = {
    enable = lib.mkEnableOption "A modern runtime for JavaScript and TypeScript.";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.deno];
  };
}
