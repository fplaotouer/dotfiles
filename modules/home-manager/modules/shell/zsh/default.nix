{
  lib,
  config,
  pkgs,
  ...
}: {
  home.file."${config.xdg.stateHome}/zsh/.keep".text = "";
  programs.zsh = {
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.path = "${config.xdg.stateHome}/zsh/history";
  };
}
