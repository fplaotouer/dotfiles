{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nix
    ./nixpkgs
    ./common
    ./users/pangz
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      ./home-manager
    ];
  };

  system.stateVersion = 4;
}
