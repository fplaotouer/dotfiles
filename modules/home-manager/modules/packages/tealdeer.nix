{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.tealdeer.settings = {
    updates = {
      auto_update = true;
      # auto update weekly
      auto_update_interval_hours = 168;
    };
  };
}
