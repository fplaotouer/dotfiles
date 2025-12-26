{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.dufs;
in {
  options.programs.dufs = {
    enable = lib.mkEnableOption "A file server that supports static serving, uploading, searching, accessing control, webdav";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.dufs];
  };
}
