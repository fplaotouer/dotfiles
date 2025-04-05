{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./nixConf.nix
    ./nixpkgs.nix
    ./modules
  ];
}
