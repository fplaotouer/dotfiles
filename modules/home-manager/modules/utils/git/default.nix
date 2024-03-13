{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.git;
in {
  config = lib.mkIf (cfg.enable) {
    home.packages = [pkgs.git-crypt];
    programs = {
      git = {
        userName = "Pangz Feng";
        userEmail = "43704063+fplaotouer@users.noreply.github.com";
        ignores = [
          ".idea"
          ".vscode"
          ".env"
          ".envrc"
          ".DS_Store"
        ];
        extraConfig = {
          github.user = "fplaotouer";
          init.defaultBranch = "main";
          core.autocrlf = "input";
          core.quotePath = false;
        };
        aliases = {
          # view the changes staged for the next commit relative to the latest commit
          ds = "diff --cached";
          # logging
          lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
          plg = "log --graph --pretty='format:%C(red)%d%C(reset) %C(yellow)%h%C(reset) %ar %C(green)%aN%C(reset) %s'";
          tlg = "log --stat --since='1 Day Ago' --graph --pretty=oneline --abbrev-commit --date=relative";
          rank = "shortlog -sn --no-merges";
        };
        delta = {
          enable = true;
          options = {
            line-numbers = true;
            side-by-side = true;
          };
        };
      };
    };
  };
}
