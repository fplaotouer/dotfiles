{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    functions = {
      __fish_command_not_found_handler = {
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };
      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };
    shellAbbrs = {
      v = "nvim";
    };
    loginShellInit = ''
      ### fish PATH reorder workaround: https://github.com/LnL7/nix-darwin/issues/122
      # Add nix binary paths to the PATH
      # Perhaps someday will be fixed in nix or nix-darwin itself
      if test (uname) = Darwin
          fish_add_path --prepend --global "$HOME/.nix-profile/bin" /etc/profiles/per-user/$USER/bin /nix/var/nix/profiles/default/bin /run/current-system/sw/bin
      end
    '';
  };
}
