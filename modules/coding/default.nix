{ pkgs, ... }:
{
  imports = [
    ./agent-browser.nix
    ./zed.nix
    ./android.nix
  ];

  home.packages = with pkgs; [
    gh
  ];
}
