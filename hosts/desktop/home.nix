{ pkgs, nix-colors, ... }:
{
  home.stateVersion = "26.05";

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

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  # Advertise dark mode via the settings portal (browsers, Electron, libadwaita apps)
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  imports = [
    nix-colors.homeManagerModules.default
    ../../home/common.nix
    ../../modules/hyprland/default.nix
    ../../modules/coding/default.nix
    ../../modules/apps/foot.nix
  ];

  home.packages = [
    # Delta agent workspace — requires the official tarball in the store,
    # see packages/delta.nix for the one-time nix-prefetch-url step.
    (pkgs.callPackage ../../packages/delta.nix { })
  ];
}
