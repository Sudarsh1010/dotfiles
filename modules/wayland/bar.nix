{ pkgs, extraDir, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  xdg.configFile."waybar" = {
    source = "${extraDir}/waybar";
    recursive = true;
    force = true;
  };
}
