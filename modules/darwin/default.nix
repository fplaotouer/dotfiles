{...}: {
  imports = [
    ./../common
    ./modules
  ];

  config = {
    nix = {
      useDaemon = true;
      optimise.automatic = true;
      settings = {
        sandbox = false;
        use-case-hack = true;
      };
    };
    services.nix-daemon.enable = true;
    environment.loginShell = "/run/current-system/sw/bin/fish";
  };
}
