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
    # Oh My Pi (omp.sh) terminal coding agent, built from source via its flake.
    # Keeps its own nixpkgs pin so the bun2nix/rust toolchain stays as upstream tested it.
    oh-my-pi.url = "github:can1357/oh-my-pi";
    # Zed editor, built from source via its official flake (tracks main).
    # Deliberately does NOT follow our nixpkgs: keeping upstream's own pins keeps
    # derivations identical to CI, so builds are served from zed.cachix.org.
    # Update with `nix flake update zed`.
    zed.url = "github:zed-industries/zed";
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
        herdr = inputs.herdr.packages.${final.stdenv.hostPlatform.system}.default;
      };
      # Expose Oh My Pi as pkgs.omp
      ompOverlay = final: _prev: {
        omp = inputs.oh-my-pi.packages.${final.stdenv.hostPlatform.system}.omp;
      };
      # Replace nixpkgs' zed-editor with upstream's flake build (tracks main,
      # binary-cached at zed.cachix.org). Bump with `nix flake update zed`.
      zedOverlay = final: _prev: {
        zed-editor = inputs.zed.packages.${final.stdenv.hostPlatform.system}.default;
      };
    in
    {
      # This defines your macOS Home Manager configuration
      homeConfigurations."sudarsh@mac" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          overlays = [
            nur.overlays.default
            herdrOverlay
            ompOverlay
            zedOverlay
          ]; # Add NUR overlay
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
              nixpkgs.overlays = [
                nur.overlays.default
                herdrOverlay
                ompOverlay
                zedOverlay
              ];

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
