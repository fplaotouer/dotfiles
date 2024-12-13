{
  config,
  pkgs,
  ...
}: {
  home.sessionPath = ["${config.home.homeDirectory}/Library/Application Support/Coursier/bin"];

  programs = {
    neovim.defaultEditor = true;
    neovim.lazyVim = true;

    alacritty.enable = true;
    zellij.enable = true;

    taskwarrior.enable = true;

    deno.enable = true;
    poetry.enable = true;

    alejandra.enable = true;
    lazygit.enable = true;
    gitui.enable = true;
    sshpass.enable = true;
    dufs.enable = true;
    ouch.enable = true;
    slides.enable = true;
    tokei.enable = true;
    tealdeer.enable = true;
    du-dust.enable = true;
    procs.enable = true;
    navi.enable = true;
    xdg-utils.enable = true;
    direnv.enable = true;
    just-cli.enable = true;
    neofetch.enable = true;
    fzf.enable = true;
    wget.enable = true;

    git = {
      userName = "Pangz Feng";
      userEmail = "43704063+fplaotouer@users.noreply.github.com";
      extraConfig = {
        github.user = "fplaotouer";
      };
    };
  };
}
