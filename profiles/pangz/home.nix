{
  config,
  pkgs,
  ...
}: {
  toolchains = {
    haskell.enable = true;
    rust.enable = true;
    zig.enable = true;
  };

  home.sessionPath = ["${config.home.homeDirectory}/Library/Application Support/Coursier/bin"];

  programs = {
    neovim.defaultEditor = true;
    neovim.lazyVim = true;

    deno.enable = true;

    alacritty.enable = true;
    tmux.enable = true;
    zellij.enable = true;

    lazygit.enable = true;
    gitui.enable = true;
    sshpass.enable = true;
    dufs.enable = true;
    ouch.enable = true;
    slides.enable = true;
    syncthing.enable = true;
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
    bottom.enable = true;
    just-cli.enable = true;
    neofetch.enable = true;
    fzf.enable = true;
    icdiff.enable = true;
    wget.enable = true;

    bat.enable = true;
    sd.enable = true;
    jq.enable = true;
    fd.enable = true;
    lsd.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
  };
}
