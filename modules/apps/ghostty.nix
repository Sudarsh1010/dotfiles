{
  pkgs,
  ...
}:
{
  # Enable Ghostty
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

    enableFishIntegration = true;
    settings = {
      font-family = "Iosevka Nerd Font Propo";
      font-size = 12;
      adjust-cell-height = 8;

      window-padding-x = 8;
      window-padding-y = 4;
      window-padding-balance = true;

      app-notifications = "no-clipboard-copy";
      shell-integration = "fish";
      mouse-hide-while-typing = true;
      macos-titlebar-style = "hidden";
      macos-option-as-alt = true;

      # Reference our custom theme by name
      background-opacity = 1;
      theme = "Gruvbox Dark";
    };
  };
}
