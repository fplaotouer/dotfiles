{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.stack];

  toolchains.haskell.enable = true;
  toolchains.rust.enable = true;
  toolchains.zig.enable = true;

  programs = {
    neovim.defaultEditor = true;
    helix.enable = true;

    go.enable = true;
    deno.enable = true;
    poetry.enable = true;

    alacritty.enable = true;
    tmux.enable = true;
    kitty.enable = true;
    zellij.enable = true;

    mpv.enable = true;
    ouch.enable = true;
    slides.enable = true;
    taskwarrior.enable = true;
    bitwise.enable = true;
    hledger.enable = true;
    tokei.enable = true;
    tshark.enable = true;
    alejandra.enable = true;
    hyperfine.enable = true;
    tealdeer.enable = true;
    du-dust.enable = true;
    aria2.enable = true;
    procs.enable = true;
    navi.enable = true;
    xplr.enable = true;
    usql.enable = true;

    bottom.enable = true;
    just-cli.enable = true;
    neofetch.enable = true;
    fzf.enable = true;
    icdiff.enable = true;
    wget.enable = true;

    xdg-utils.enable = true;
    direnv.enable = true;
    bat.enable = true;
    sd.enable = true;
    jq.enable = true;
    fd.enable = true;
    exa.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
  };
}
