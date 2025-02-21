{
  lib,
  config,
  pkgs,
  ...
}: {
  xdg.stateFile."bash/.keep".text = "";
  programs.bash = {
    enableCompletion = true;
    historyFile = "${config.xdg.stateHome}/bash/history";
  };
}
