{ pkgs, extraDir, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  home.file.".config/waybar" = {
    source = "${extraDir}/waybar";
    recursive = true;
    force = true;
  };
}
