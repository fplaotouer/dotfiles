{
  config,
  pkgs,
  ...
}: {
  toolchains.haskell.enable = true;
  toolchains.rust.enable = true;
  home.packages = [pkgs.stack];

  programs = {
    neovim.defaultEditor = true;
    helix.enable = true;

    go.enable = true;

    xdg-utils.enable = true;
    kitty.enable = true;
    alacritty.enable = true;
    zellij.enable = true;
    tmux.enable = true;
    mpv.enable = true;

    alejandra.enable = true;
    hyperfine.enable = true;
    syncthing.enable = true;
    neofetch.enable = true;
    tealdeer.enable = true;
    du-dust.enable = true;
    ansible.enable = true;
    tshark.enable = true;
    bottom.enable = true;
    aria2.enable = true;
    procs.enable = true;
    qemu.enable = true;
    mtr.enable = true;
    fzf.enable = true;
    bat.enable = true;
    sd.enable = true;
    jq.enable = true;
    fd.enable = true;
    deno.enable = true;
    exa.enable = true;
    navi.enable = true;
    xplr.enable = true;
    usql.enable = true;
    tokei.enable = true;
    drill.enable = true;
    just-cli.enable = true;
    sshpass.enable = true;
    hledger.enable = true;
    icdiff.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    direnv.enable = true;
    starship.enable = true;
  };
}
