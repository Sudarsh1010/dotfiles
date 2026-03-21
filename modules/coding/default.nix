{ pkgs, ... }:
{
  imports = [
    ./agent-browser.nix
  ];

  home.packages = with pkgs; [
    gh
  ];
}
