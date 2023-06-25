{
  lib,
  config,
  pkgs,
  ...
}: {
  home.file."${config.xdg.stateHome}/bash/.keep".text = "";
  programs.bash = {
    enableCompletion = true;
    historyFile = "${config.xdg.stateHome}/bash/history";
  };
}
