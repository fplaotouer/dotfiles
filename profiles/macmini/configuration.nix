{...}: {
  imports = [
    ./../../modules/darwin
    ./hardware-configuration.nix
    ./../../users/pangz
  ];

  home-manager.users.pangz = {
    imports = [./home.nix];
  };
  system.primaryUser = "pangz";

  homebrew = {
    enable = true;
    casks = [
      "parallels"
    ];
  };
}
