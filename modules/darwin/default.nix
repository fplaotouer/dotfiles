{...}: {
  imports = [
    ./../common
    ./modules
  ];

  config = {
    nix = {
      useDaemon = true;
      settings = {
        sandbox = false;
        use-case-hack = true;
      };
    };
    services.nix-daemon.enable = true;
  };
}
