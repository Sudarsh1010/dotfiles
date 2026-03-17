{ pkgs, lib, ... }: {
  imports = [
    ./notification.nix
    ./wallpaper.nix
    ./bar.nix
  ];
}
