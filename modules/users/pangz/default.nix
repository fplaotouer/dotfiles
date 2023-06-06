{
  lib,
  config,
  pkgs,
  ...
}: {
  users.users.pangz = {
    description = "Pangz Feng";
    shell = pkgs.fish;
    home =
      if pkgs.stdenv.isDarwin
      then /Users/pangz
      else /home/pangz;
  };
}
