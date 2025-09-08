{
  config,
  pkgs,
  ...
}: {
  programs = {
    neovim.defaultEditor = true;
    neovim.lazyVim = true;

    dufs.enable = true;
    ouch.enable = true;
    tealdeer.enable = true;
    du-dust.enable = true;
    procs.enable = true;
    navi.enable = true;
    xdg-utils.enable = true;
    direnv.enable = true;
    just-cli.enable = true;

    git = {
      userName = "Pangz Feng";
      userEmail = "43704063+fplaotouer@users.noreply.github.com";
      extraConfig = {
        github.user = "fplaotouer";
      };
    };
  };
}
