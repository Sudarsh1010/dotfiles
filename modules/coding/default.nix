{ pkgs, ... }:
{
  imports = [
    ./agent-browser.nix
    ./zed.nix
  ];

  home.packages = with pkgs; [
    gh
  ];
}
