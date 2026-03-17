{ pkgs, extraDir, config, ... }: {
  home.packages = with pkgs; [ swaybg ];
}
