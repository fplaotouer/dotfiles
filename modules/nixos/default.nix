{...}: {
  imports = [
    ./../common
    ./modules
  ];

  config = {
    system.stateVersion = "25.05";
  };
}
