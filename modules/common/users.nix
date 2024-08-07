{
  lib,
  config,
  pkgs,
  ...
}: {
  users.users = {
    pangz = {
      name = "pangz";
      description = "Pangz Feng";
      shell = pkgs.fish;
      createHome = true;
      home =
        if pkgs.stdenv.isDarwin
        then /Users/pangz
        else /home/pangz;
    };
  };
}
