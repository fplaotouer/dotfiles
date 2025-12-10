{...}: {
  programs = {
    neovim.defaultEditor = true;
    neovim.lazyVim = true;

    taskwarrior.enable = true;
    hledger.enable = true;

    uv.enable = true;

    alejandra.enable = true;
    sshpass.enable = true;
    dufs.enable = true;
    ouch.enable = true;
    tokei.enable = true;
    tealdeer.enable = true;
    dust.enable = true;
    procs.enable = true;
    navi.enable = true;
    xdg-utils.enable = true;
    direnv.enable = true;
    just-cli.enable = true;

    git = {
      settings = {
        github.user = "fplaotouer";
        user = {
          name = "Pangz Feng";
          email = "43704063+fplaotouer@users.noreply.github.com";
        };
      };
    };
  };
}
