{
  description = "fpnix";

  nixConfig.extra-experimental-features = "nix-command flakes";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable-small";
    nixpkgs-stable.url = "nixpkgs/nixos-23.05-small";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    sops-nix,
    flake-utils,
    neovim-nightly-overlay,
    darwin,
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
        # Extra channel
        nixpkgsStable = final: prev: {stablePkgs = nixpkgs-stable.legacyPackages.${prev.system};};
        # Neovim Nightly
        # until this [issue](https://github.com/NixOS/nixpkgs/issues/229275) resolved
        # neovimNightly = neovim-nightly-overlay.overlay;
      };

      darwinConfigurations.pangz = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./modules
          ./modules/darwin
          ./modules/users/pangz
          ./hosts/pangz/configuration.nix
          home-manager.darwinModule
          sops-nix.nixosModules.sops
          {
            home-manager.users.pangz = {
              imports = [./hosts/pangz/home.nix];
            };
            nixpkgs.overlays = builtins.attrValues self.overlays;
            nix = {
              registry.n.flake = self;
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
              ./hosts/minimal/home.nix
              sops-nix.homeManagerModule
              {
                home.username = "pangz";
                home.homeDirectory = "/home/pangz";
                nixpkgs.overlays = builtins.attrValues self.overlays;
                nix.registry.n.flake = self;
              }
            ];
          };
        server-pangz = let
          system = "x86_64-linux";
          pkgs = builtins.getAttr system self.legacyPackages;
        in
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {};
            modules = [
              ./modules/home-manager
              ./hosts/server/home.nix
              sops-nix.homeManagerModule
              {
                home.username = "pangz";
                home.homeDirectory = "/home/pangz";
                nixpkgs.overlays = builtins.attrValues self.overlays;
                nix.registry.n.flake = self;
              }
            ];
          };
      };
    };
}
