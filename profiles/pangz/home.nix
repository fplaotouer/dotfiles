{
  config,
  pkgs,
  ...
}: {
  home.sessionPath = ["${config.home.homeDirectory}/Library/Application Support/Coursier/bin"];

  programs = {
    neovim.defaultEditor = true;
    neovim.lazyVim = true;

    deno.enable = true;
    poetry.enable = true;
    tailwindcss.enable = true;

    alacritty.enable = true;
    tmux.enable = true;
    # zellij.enable = true;

    lazygit.enable = true;
    gitui.enable = true;
    sshpass.enable = true;
    dufs.enable = true;
    ouch.enable = true;
    slides.enable = true;
    taskwarrior.enable = true;
    hledger.enable = true;
    tokei.enable = true;
    tshark.enable = true;
    hyperfine.enable = true;
    tealdeer.enable = true;
    du-dust.enable = true;
    aria2.enable = true;
    procs.enable = true;
    navi.enable = true;
    xplr.enable = true;
    usql.enable = true;
    xdg-utils.enable = true;
    direnv.enable = true;
    just-cli.enable = true;
    neofetch.enable = true;
    fzf.enable = true;
    icdiff.enable = true;
    wget.enable = true;

    ssh = {
      matchBlocks = {
        "github.com" = {
          hostname = "ssh.github.com";
          port = 443;
        };
      };
    };
    git = {
      userName = "Pangz Feng";
      userEmail = "43704063+fplaotouer@users.noreply.github.com";
      extraConfig = {
        github.user = "fplaotouer";
      };
    };
  };
}
