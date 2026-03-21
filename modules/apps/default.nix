{ pkgs, lib, ... }:
{
  imports = [
    ./cli.nix
    ./ghostty.nix
  ];

  # GUI apps are only installed on macOS
  home.packages = with pkgs; [
    vesktop
    spotify
  ];
}
