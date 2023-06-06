{
  lib,
  config,
  pkgs,
  ...
}: {
  programs.helix.languages = {
    javascript = {
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
    };
    jsx = {
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
    };
    typescript = {
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
    };
    tsx = {
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
    };
  };
}
