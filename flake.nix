{
  description = "fpnix";

  nixConfig.extra-experimental-features = "nix-command flakes";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11-small";

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
    home-manager,
    darwin,
    neovim-nightly-overlay,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem
    (system: {
      legacyPackages = import nixpkgs {
        inherit system;
        overlays = builtins.attrValues self.overlays;
      };
    })
    // {
      overlays = {
        neovimNightlyOverlay = neovim-nightly-overlay.overlays.default;
        # Extra channel
        nixpkgsStable = final: prev: {stablePkgs = nixpkgs-stable.legacyPackages.${prev.system};};
      };

      darwinConfigurations.pangz = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules/darwin
          ./profiles/pangz/configuration.nix
          home-manager.darwinModules.home-manager
          {
            nix.registry.n.flake = self;
            nixpkgs.overlays = builtins.attrValues self.overlays;

            home-manager.users.pangz = {
              imports = [./profiles/pangz/home.nix];
            };
            nix = {
              nixPath = [
                {nixpkgs = nixpkgs;}
              ];
            };
          }
        ];
      };

      homeConfigurations = {
        minimal = let
          system = "x86_64-linux";
          pkgs = builtins.getAttr system self.legacyPackages;
        in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {};
            modules = [
              ./modules/home-manager
              ./profiles/minimal/home.nix
              {
                nix.registry.n.flake = self;
                nixpkgs.overlays = builtins.attrValues self.overlays;

                home = {
                  username = "pangz";
                  homeDirectory = "/home/pangz";
                };
              }
            ];
          };
      };
    };
}
