{ pkgs, ... }: {
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };

  programs.neovim = {
    package = pkgs.neovim;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
    extraPackages = with pkgs; [
      tree-sitter
      taplo
      nil
      shfmt
      shellcheck
      stylua
      alejandra
      bash-language-server
      lua-language-server
      yaml-language-server
    ];
  };
}
