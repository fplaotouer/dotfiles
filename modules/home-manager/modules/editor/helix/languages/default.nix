{
  config,
  pkgs,
  ...
}: {
  imports = let
    inherit (builtins) readDir attrNames filter map;
    paths = attrNames (readDir ./.);
    modules = filter (name: name != "default.nix") paths;
  in
    map (name: ./. + "/${name}") modules;
}
