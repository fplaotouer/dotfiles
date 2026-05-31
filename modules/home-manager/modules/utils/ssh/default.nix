{...}: {
  programs.ssh = {
    package = null;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
      };
    };
  };
}
