{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.poetry = {
    package = pkgs.poetry.withPlugins (ps: with ps; [poetry-plugin-up poetry-plugin-export]);
    settings = {
      virtualenvs.create = true;
      virtualenvs.in-project = true;
    };
  };
}
