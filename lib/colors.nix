{
  # Convert nix-colors palette to Ghostty palette format
  ghosttyPalette = palette: [
    "0=${palette.base00}"
    "1=${palette.base08}"
    "2=${palette.base0B}"
    "3=${palette.base0A}"
    "4=${palette.base0D}"
    "5=${palette.base0E}"
    "6=${palette.base0C}"
    "7=${palette.base07}"
    "8=${palette.base03}"
    "9=${palette.base08}"
    "10=${palette.base01}"
    "11=${palette.base0A}"
    "12=${palette.base0D}"
    "13=${palette.base0E}"
    "14=${palette.base0C}"
    "15=${palette.base07}"
  ];
  
  # Convert nix-colors palette to Starship palette format
  starshipPalette = palette: {
    bg = palette.base00;
    fg = palette.base05;
    gray = palette.base03;
    red = palette.base08;
    green = palette.base0B;
    blue = palette.base0D;
    yellow = palette.base0A;
    purple = palette.base0E;
    cyan = palette.base0C;
    white = palette.base07;
  };
}
