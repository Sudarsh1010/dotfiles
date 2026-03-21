{ username, pkgs, ... }:
{
  home.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home/common.nix
    ../../modules/core/macos.nix
    ../../modules/apps/browser.nix
  ];
}
