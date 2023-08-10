{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.toolchains.deno;
in {
  options.toolchains.deno = {
    enable = lib.mkEnableOption "A modern runtime for JavaScript and TypeScript.";
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.deno];
  };
}
