{ pkgs, extraDir, config, ... }: {
  home.packages = with pkgs; [
    rofi
    grim
    slurp
  ];

  home.file.".config/hypr" = {
    source = "${extraDir}/hypr";
    recursive = true;
    force = true;
  };

  home.file.".config/rofi" = {
    source = "${extraDir}/rofi";
    recursive = true;
  };

  programs.kitty.enable = true;
  programs.waybar.enable = true;

  imports = [
    ../wayland/default.nix
  ];
}
