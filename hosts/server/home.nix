{
  config,
  pkgs,
  ...
}: {
  programs = {
    neovim.defaultEditor = true;
    starship.enable = true;
    neofetch.enable = true;
    fzf.enable = true;
    bat.enable = true;
    sd.enable = true;
    jq.enable = true;
    fd.enable = true;
    exa.enable = true;
    xplr.enable = true;
    usql.enable = true;
    just-cli.enable = true;
    icdiff.enable = true;
    zoxide.enable = true;
    ripgrep.enable = true;
    direnv.enable = true;
  };
}
