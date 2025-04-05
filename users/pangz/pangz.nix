{pkgs, ...}: {
  home = {
    username = "pangz";
    homeDirectory =
      if pkgs.stdenv.isDarwin
      then /Users/pangz
      else /home/pangz;
  };
}
