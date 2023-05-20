{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.helix.languages = [
    {
      name = "javascript";
      shebangs = ["deno" "node"];
      roots = ["deno.jsonc" "deno.json" "package.json" "tsconfig.json"];
      language-server = {
        command = "deno";
        args = ["lsp"];
        language-id = "javascript";
      };
      config = {
        enable = true;
        lint = true;
        unstable = true;
      };
    }

    {
      name = "jsx";
      shebangs = ["deno" "node"];
      roots = ["deno.jsonc" "deno.json" "package.json" "tsconfig.json"];
      language-server = {
        command = "deno";
        args = ["lsp"];
        language-id = "javascriptreact";
      };
      config = {
        enable = true;
        lint = true;
        unstable = true;
      };
    }
    {
      name = "typescript";
      shebangs = ["deno" "node"];
      roots = ["deno.jsonc" "deno.json" "package.json" "tsconfig.json"];
      language-server = {
        command = "deno";
        args = ["lsp"];
        language-id = "typescript";
      };
      config = {
        enable = true;
        lint = true;
        unstable = true;
      };
    }
    {
      name = "tsx";
      shebangs = ["deno" "node"];
      roots = ["deno.jsonc" "deno.json" "package.json" "tsconfig.json"];
      language-server = {
        command = "deno";
        args = ["lsp"];
        language-id = "typescriptreact";
      };
      config = {
        enable = true;
        lint = true;
        unstable = true;
      };
    }
  ];
}
