{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    escapeTime = 10;
    historyLimit = 5000;
    newSession = true;
    sensibleOnTop = true;
    keyMode = "vi";
    baseIndex = 1;
    reverseSplit = true;
    customPaneNavigationAndResize = true;
    tmuxinator.enable = true;
    plugins = with pkgs.tmuxPlugins; [
      cpu
      sensible
    ];

    extraConfig = ''
      set -g status-position bottom
      set -g set-clipboard on
      set -g mouse on
      set -g set-titles on
      set -g set-titles-string "#T"
      set -g renumber-windows on
    '';
  };
}
