{ pkgs, extraDir, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    # Managed by systemd (graphical-session.target under UWSM) instead of
    # Hyprland's autostart, so it isn't tied to config-load timing.
    systemd.enable = true;
  };

  xdg.configFile."waybar" = {
    source = "${extraDir}/waybar";
    recursive = true;
    force = true;
  };
}
