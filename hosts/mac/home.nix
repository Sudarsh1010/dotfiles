{ username, pkgs, ... }:
{
  home.stateVersion = "26.05";
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home/common.nix
    ../../modules/core/macos.nix
    ../../modules/coding/default.nix
  ];
}
