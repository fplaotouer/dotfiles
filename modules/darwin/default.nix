{...}: {
  imports = [
    ./../common
    ./modules
  ];

  config = {
    nix = {
      settings = {
        sandbox = false;
        use-case-hack = true;
      };
    };
    system.stateVersion = 6;
  };
}
