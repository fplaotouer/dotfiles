{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zellij = {
    settings = {
      theme = "gruvbox-dark";
      default_mode = "locked";
      pane_frames = false;
    };
  };
}
