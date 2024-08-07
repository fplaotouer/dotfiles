{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./../common/nixConf.nix
    ./../common/nixpkgs.nix
    ./modules
  ];
}
