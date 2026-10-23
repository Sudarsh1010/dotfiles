{ username, pkgs, ... }:
let
  # Same font the desktop installs via NixOS fonts.fontconfig.
  ioskeley-mono = pkgs.callPackage ../../packages/ioskeley-mono.nix { };
in
{
  home.stateVersion = "26.05";
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../home/common.nix
    ../../modules/core/macos.nix
    ../../modules/coding/default.nix
  ];

  # macOS doesn't scan ~/.nix-profile for fonts, so link the TTFs into
  # ~/Library/Fonts for zed/ghostty (they reference this family by name).
  home.file."Library/Fonts/IoskeleyMono" = {
    source = "${ioskeley-mono}/share/fonts/truetype";
  };

  home.sessionPath = [
    "/usr/local/go/bin"
    "$HOME/go/bin"
  ];
}
