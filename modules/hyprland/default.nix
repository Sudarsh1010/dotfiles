{ pkgs, extraDir, ... }:
{
  # Polkit authentication agent (GUI prompt for pkexec/polkit requests).
  # Hyprland's welcome screen flags this as missing otherwise.
  services.hyprpolkitagent.enable = true;

  home.packages = with pkgs; [
    rofi
    grim
    slurp
    wl-clipboard
  ];

  xdg.configFile."hypr" = {
    source = "${extraDir}/hypr";
    recursive = true;
    force = true;
  };

  xdg.configFile."rofi" = {
    source = "${extraDir}/rofi";
    recursive = true;
  };

  imports = [
    ../wayland/default.nix
  ];
}
