{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zellij = {
    settings = {
      theme = "gruvbox-dark";
      default_shel = "${pkgs.fish}/bin/fish";
      default_mode = "locked";
      pane_frames = false;
      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };
    };
  };
}
