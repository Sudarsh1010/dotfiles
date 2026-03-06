{ colorLib, pkgs, config, lib, ... }: {
  # home.packages = with pkgs; [
  #   # ✅ Use ghostty-bin for macOS, ghostty for Linux
  # ] ++ lib.optionals pkgs.stdenv.isDarwin [
  #   ghostty-bin  # Pre-built binary for macOS
  # ] ++ lib.optionals pkgs.stdenv.isLinux [
  #   ghostty      # Source build for Linux
  # ];

  # Enable Ghostty
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

    enableFishIntegration = true;
    settings = {
      font-family = "0xProto Nerd Font";
      font-size = 14;
      # Reference our custom theme by name
      theme = config.colorScheme.name;
      macos-option-as-alt = true;
    };
  };

  xdg.configFile."ghostty/themes/${config.colorScheme.name}".text = ''
    # Theme: ${config.colorScheme.name} by ${config.colorScheme.author}

    # Base colors (hex without # prefix)
    background = ${lib.removePrefix "#" config.colorScheme.palette.base00}
    foreground = ${lib.removePrefix "#" config.colorScheme.palette.base05}
    cursor-color = ${lib.removePrefix "#" config.colorScheme.palette.base05}
    selection-background = ${lib.removePrefix "#" config.colorScheme.palette.base04}
    selection-foreground = ${lib.removePrefix "#" config.colorScheme.palette.base00}

    # ANSI palette (0-15) - semicolon-separated list
    palette = ${lib.concatStringsSep ";" (colorLib.ghosttyPalette config.colorScheme.palette)}
  '';
}
