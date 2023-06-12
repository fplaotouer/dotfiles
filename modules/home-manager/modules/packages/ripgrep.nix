{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.ripgrep = {
    arguments = [
      "--max-columns=150"
      "--max-columns-preview"
      "--colors=line:none"
      "--colors=line:style:bold"
      "--smart-case"
    ];
  };
}
