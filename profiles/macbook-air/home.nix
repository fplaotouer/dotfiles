{pkgs, ...}: {
  home.packages = [pkgs.kubernetes-helm pkgs.minikube pkgs.socket-vmnet];
  programs = {
    neovim.defaultEditor = true;

    taskwarrior.enable = true;
    hledger.enable = true;

    ansible.enable = true;
    uv.enable = true;

    yt-dlp.enable = true;
    aria2.enable = true;
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
