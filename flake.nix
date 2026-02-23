{
  description = "fpnix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "nixpkgs/nixos-25.11-small";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixos-hardware,
    home-manager,
    darwin,
    neovim-nightly-overlay,
    flake-utils,
  }: let
    lib = nixpkgs.lib // darwin.lib // home-manager.lib;
  in
    flake-utils.lib.eachDefaultSystem
    (system: {
      legacyPackages = import nixpkgs {
        inherit system;
        overlays = builtins.attrValues self.overlays;
      };
    })
    // {
      inherit lib;
      overlays = {
        neovimNightlyOverlay = neovim-nightly-overlay.overlays.default;
        # Extra channel
        nixpkgsStable = final: prev: {stablePkgs = nixpkgs-stable.legacyPackages.${prev.system};};
      };

      darwinConfigurations = {
        macmini = lib.darwinSystem {
          specialArgs = {inherit self;};
          modules = [./profiles/macmini/configuration.nix];
        };
        macbook-air = lib.darwinSystem {
          specialArgs = {inherit self;};
          modules = [./profiles/macbook-air/configuration.nix];
        };
      };
    };
}
