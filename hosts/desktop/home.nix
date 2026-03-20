{ pkgs, nix-colors, ... }: {
  home.stateVersion = "25.11";

  home.pointerCursor = {
    gtk.enable = true;
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

  imports = [
    nix-colors.homeManagerModules.default
    ../../home/common.nix
    ../../modules/hyprland/default.nix
    ../../modules/apps/browser.nix
    ../../modules/coding/default.nix
  ];
}
