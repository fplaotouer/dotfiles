{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.zellij = {
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      theme = "gruvbox-dark";
      default_mode = "locked";
      pane_frames = false;
    };
  };
}
