{...}: {
  programs.gpg = {
    settings = {};
    scdaemonSettings = {};
  };
  services.gpg-agent = {
    defaultCacheTtl = 1800;
    defaultCacheTtlSsh = 1800;
    maxCacheTtl = 7200;
    maxCacheTtlSsh = 7200;
  };
}
