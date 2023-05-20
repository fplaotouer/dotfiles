{
  lib,
  config,
  pkgs,
  ...
}: {
  nixpkgs.config = {
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "vscode"
        "vscode-extension-ms-vscode-remote-remote-ssh"
      ];
  };
}
