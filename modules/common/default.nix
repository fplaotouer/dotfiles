{...}: {
  imports = let
    inherit (builtins) readDir attrNames filter map;
    paths = attrNames (readDir ./.);
    modules = filter (name: name != "default.nix") paths;
  in
    map (name: ./. + "/${name}") modules;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      ./../home-manager/modules
    ];
  };

  system.stateVersion = 4;
}
