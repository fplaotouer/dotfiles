{pkgs, ...}: {
  environment = {
    systemPackages = builtins.attrValues {
      inherit (pkgs) ghostty-bin utm llama-cpp;
    };
  };
}
