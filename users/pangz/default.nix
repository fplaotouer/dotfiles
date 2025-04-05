{pkgs, ...}: {
  users.users.pangz = {
    name = (import ./pangz.nix {inherit pkgs;}).home.username;
    description = "Pangz Feng";
    shell = pkgs.fish;
    createHome = true;
    home = (import ./pangz.nix {inherit pkgs;}).home.homeDirectory;
  };

  home-manager.users.pangz = {
    imports = [./pangz.nix];
  };
}
