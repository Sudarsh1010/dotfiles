{ modulesDir, pkgs, nix-colors, ... }: {
  # This value determines the Home Manager release that your
  # configuration is compatible with. It helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "25.11"; 

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };


  # Import modular configurations
  imports = [
    nix-colors.homeManagerModules.default

    "${modulesDir}/theme.nix"

    # Core tools
    "${modulesDir}/core/shell.nix"
    "${modulesDir}/core/git.nix"
    "${modulesDir}/core/nvim.nix"

    # wm
    "${modulesDir}/hyprland/default.nix"

    # Development environments
    "${modulesDir}/dev/default.nix"

    # Applications (GUI + CLI)
    "${modulesDir}/apps/browser.nix"
    "${modulesDir}/apps/default.nix"

    "${modulesDir}/coding/default.nix"
  ];

  # Install Home Manager itself to manage future updates
  programs.home-manager.enable = true;
}
