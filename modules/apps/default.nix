{ pkgs, lib, ... }: {
  imports = [
    ./cli.nix
    ./gui.nix
    ./ghostty.nix
  ];

  # GUI apps are only installed on macOS
  home.packages = with pkgs; lib.optionals pkgs.stdenv.isDarwin [
    vesktop
    spotify
  ];
}
