{pkgs, ...}: {
  environment = {
    systemPackages = builtins.attrValues {
      inherit (pkgs) llama-cpp;
    };
  };
}
