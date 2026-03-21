{ pkgs, extraDir, ... }:
{
  home.packages = with pkgs; [
    rofi
    grim
    slurp
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
