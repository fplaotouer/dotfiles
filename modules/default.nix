{
  config,
  pkgs,
  ...
}: {
  # Configurations here is system level such as NixOS and nix-darwin,
  # for home-manager, we should include the modules manually.
  imports = [
    ./nix
    ./nixpkgs
  ];

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 2d";
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      ./home-manager
    ];
  };

  environment.shells = [pkgs.fish];

  system.stateVersion = 4;
}
