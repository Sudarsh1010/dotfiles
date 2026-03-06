{ lib, ... }: {
  # Define custom color scheme using nix-colors format
  colorScheme = lib.mkForce {
    name = "solitude";
    author = "HANCORE-linux";
    variant = "dark";
    palette = {
      # Base colors (following base16 convention)
      base00 = "#101315";  # Background
      base01 = "#343d41";  # Lighter Background
      base02 = "#565d60";  # Comments
      base03 = "#62676a";  # Selection
      base04 = "#798186";  # Accent / Primary
      base05 = "#cacccc";  # Foreground
      base06 = "#cbc2be";  # Bright UI
      base07 = "#c5c4c3";  # Brightest
      base08 = "#de6145";  # Red
      base09 = "#d9dbdc";  # Orange
      base0A = "#c9c2b4";  # Yellow
      base0B = "#9fa5a9";  # Green
      base0C = "#707070";  # Cyan
      base0D = "#5d6367";  # Blue
      base0E = "#aeaeae";  # Magenta
      base0F = "#9a9a9a";  # Brown
    };
  };
}
