{ pkgs, ... }: {
  imports = [
    ./rust.nix
    ./go.nix
    ./node.nix
    ./python.nix
  ];

  home.packages = with pkgs; [
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
