{ pkgs, ... }:
{
  imports = [
    ./rust.nix
    ./go.nix
    ./node.nix
    ./python.nix
  ];

  home.packages = with pkgs; [
    nil
    nixd
    nixfmt
    nixfmt-tree
    bun
    gcc
    gdb
    gnumake
    cmake
    ninja
    curl
    wget
    unzip
  ];
}
