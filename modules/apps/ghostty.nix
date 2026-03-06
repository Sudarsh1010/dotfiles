{ colorLib, pkgs, config, ... }: {
  # Enable Ghostty
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

    enableFishIntegration = true;
    settings = {
      font-family = "0xProto Nerd Font";
      font-size = 15;
      adjust-cell-height = 8;

      window-padding-x = 8;
      window-padding-y = 8;
      window-padding-balance = true;

      app-notifications = "no-clipboard-copy";
      shell-integration = "fish";
      mouse-hide-while-typing = true;
      macos-titlebar-style = "hidden";
      macos-option-as-alt = true;

      # Reference our custom theme by name
      background-opacity = 0.95;
      theme = config.colorScheme.name;
    };

    themes."${config.colorScheme.name}" = {
      background = config.colorScheme.palette.base00;
      cursor-color = config.colorScheme.palette.base05;
      foreground = config.colorScheme.palette.base05;
      palette = (colorLib.ghosttyPalette config.colorScheme.palette);
      selection-background = config.colorScheme.palette.base04;
      selection-foreground = config.colorScheme.palette.base00;
    };
  };
  #
  # xdg.configFile."ghostty/themes/${config.colorScheme.name}".text = ''
  #   # Theme: ${config.colorScheme.name} by ${config.colorScheme.author}
  #
  #   # Base colors (hex without # prefix)
  #   background = ${config.colorScheme.palette.base00}
  #   foreground = ${config.colorScheme.palette.base05}
  #   cursor-color = ${config.colorScheme.palette.base05}
  #   selection-background = ${config.colorScheme.palette.base04}
  #   selection-foreground = ${config.colorScheme.palette.base00}
  #
  #   # ANSI palette (0-15) - ONE LINE PER COLOR
  #   ${lib.concatStringsSep "\n" (
  #     map (c: "palette = ${c}") (colorLib.ghosttyPalette config.colorScheme.palette)
  #   )}
  # '';
}
