{
  description = "My Nix Config (Mac + Future Homelab)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:Misterio77/nix-colors";
    nur.url = "github:nix-community/NUR";
    mac-app-util.url = "github:hraban/mac-app-util";

    hyprland.url = "github:hyprwm/Hyprland";
    # Tracks master; update with `nix flake update herdr`
    herdr = {
      url = "github:herdrdev/herdr";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # opencode.url = "github:anomalyco/opencode/v1.3.1";
  };

  outputs =
    {
      nixpkgs,
      nur,
      home-manager,
      nix-colors,
      mac-app-util,
      ...
    }@inputs:
    let
      hmExtraSpecialArgs = {
        username = "sudarsh";
        extraDir = ./extra;
        colorLib = import ./lib/colors.nix;
      };
      # Expose the herdr package as pkgs.herdr on every host/profile
      herdrOverlay = final: _prev: {
        herdr = inputs.herdr.packages.${final.system}.default;
      };
    in
    {
      # This defines your macOS Home Manager configuration
      homeConfigurations."sudarsh@mac" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = [ nur.overlays.default herdrOverlay ]; # Add NUR overlay
          config.allowUnfree = true;
        };
        modules = [
          mac-app-util.homeManagerModules.default
          nix-colors.homeManagerModules.default
          ./hosts/mac/home.nix
        ];
        extraSpecialArgs = hmExtraSpecialArgs;
      };

      nixosConfigurations."desktop" = nixpkgs.lib.nixosSystem {
        system = nixpkgs.legacyPackages.x86_64-linux;
        specialArgs = {
          inherit inputs;
          inherit nix-colors;
        };

        modules = [
          ./hosts/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          nur.modules.nixos.default

          (
            { config, pkgs, ... }:
            {
              nixpkgs.overlays = [ nur.overlays.default herdrOverlay ];

              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = hmExtraSpecialArgs // {
                inherit inputs;
                inherit nix-colors;
              };

              home-manager.users.sudarsh = import ./hosts/desktop/home.nix;
            }
          )
        ];
      };

      # Later, you will add this for your homelab:
      # nixosConfigurations."homelab-server" = ...
      nixosConfigurations."homelab" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/server/configuration.nix
          { nixpkgs.overlays = [ herdrOverlay ]; }
        ];
      };
    };
}
