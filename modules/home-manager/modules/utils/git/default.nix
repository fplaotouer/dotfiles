{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = lib.optionals config.programs.git.enable [
    pkgs.git-crypt
  ];
  programs = {
    git = {
      ignores = [
        ".idea"
        ".vscode"
        ".env"
        ".envrc"
        ".DS_Store"
      ];
      settings = {
        init = {
          defaultBranch = "main";
        };
        core = {
          autocrlf = "input";
          quotePath = false;
        };
        alias = {
          # view the changes staged for the next commit relative to the latest commit
          ds = "diff --staged";
          # logging
          lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
          plg = "log --graph --pretty='format:%C(red)%d%C(reset) %C(yellow)%h%C(reset) %ar %C(green)%aN%C(reset) %s'";
          tlg = "log --stat --since='1 Day Ago' --graph --pretty=oneline --abbrev-commit --date=relative";
          rank = "shortlog -sn --no-merges";
        };
      };
    };
    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        line-numbers = true;
        side-by-side = true;
      };
    };
  };
}
