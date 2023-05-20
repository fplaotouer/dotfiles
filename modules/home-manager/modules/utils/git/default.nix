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
          ".DS_Store"
        ];
        extraConfig = {
          github.user = "fplaotouer";
          init.defaultBranch = "main";
          core.quotePath = false;
        };
        aliases = {
          # gitui
          tui = "!gitui";
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
      gitui = {
        enable = true;
        keyConfig = "";
        theme = ''
          (
            selected_tab: Reset,
            command_fg: White,
            selection_bg: Blue,
            selection_fg: White,
            cmdbar_bg: Blue,
            cmdbar_extra_lines_bg: Blue,
            disabled_fg: DarkGray,
            diff_line_add: Green,
            diff_line_delete: Red,
            diff_file_added: LightGreen,
            diff_file_removed: LightRed,
            diff_file_moved: LightMagenta,
            diff_file_modified: Yellow,
            commit_hash: Magenta,
            commit_time: LightCyan,
            commit_author: Green,
            danger_fg: Red,
            push_gauge_bg: Blue,
            push_gauge_fg: Reset,
            tag_fg: LightMagenta,
            branch_fg: LightYellow,
          )
        '';
      };
      lazygit = {
        enable = true;
        settings = {};
      };
    };
  };
}
