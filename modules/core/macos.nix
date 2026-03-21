{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Only activate on macOS
  home.activation.macOSDefaults = lib.mkIf pkgs.stdenv.isDarwin (
    config.lib.dag.entryAfter [ "writeBoundary" ] ''
      /usr/bin/defaults write NSGlobalDomain AppleShowAllExtensions -bool true
      /usr/bin/defaults write NSGlobalDomain KeyRepeat -int 40
      /usr/bin/defaults write NSGlobalDomain InitialKeyRepeat -int 175

      # === Apply changes ===
      # Note: Some changes require logout/restart. We can't force that from HM.
      echo "macOS defaults updated. Some changes may require logout."
    ''
  );
}
