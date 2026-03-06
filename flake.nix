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
  };

  outputs = { nixpkgs, nur, home-manager, nix-colors, mac-app-util, ... }: {
    # This defines your macOS Home Manager configuration
    homeConfigurations."sudarsh@mac" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
        overlays = [ nur.overlays.default ];  # Add NUR overlay
        config.allowUnfree = true;
      };
      modules = [
        mac-app-util.homeManagerModules.default
        nix-colors.homeManagerModules.default
        ./hosts/mac/home.nix
        # You can add more modules here later
      ];
      extraSpecialArgs = {
        username = "sudarsh";
        extraDir = ./extra;
        modulesDir = ./modules;
        colorLib = import ./lib/colors.nix { lib = nixpkgs.lib; };
      };
    };

    # Later, you will add this for your homelab:
    # nixosConfigurations."homelab-server" = ...
    nixosConfigurations."homelab" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/homelab/configuration.nix
        # You can import your common modules here too!
      ];
    };
  };
}
