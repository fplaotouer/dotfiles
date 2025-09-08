{pkgs, ...}: {
  home = {
    username = "pangz";
    homeDirectory =
      if pkgs.stdenv.hostPlatform.isDarwin
      then /Users/pangz
      else /home/pangz;
  };
}
