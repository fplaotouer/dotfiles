{
  lib,
  config,
  pkgs,
  ...
}: {
  xdg.stateFile."zsh/.keep".text = "";
  programs.zsh = {
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.path = "${config.xdg.stateHome}/zsh/history";
  };
}
