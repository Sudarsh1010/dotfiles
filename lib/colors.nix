{ lib, ... }: {
  # Convert nix-colors palette to Ghostty palette format
  ghosttyPalette = palette: [
    "0=${lib.removePrefix "#" palette.base00}"
    "1=${lib.removePrefix "#" palette.base08}"
    "2=${lib.removePrefix "#" palette.base0B}"
    "3=${lib.removePrefix "#" palette.base0A}"
    "4=${lib.removePrefix "#" palette.base0D}"
    "5=${lib.removePrefix "#" palette.base0E}"
    "6=${lib.removePrefix "#" palette.base0C}"
    "7=${lib.removePrefix "#" palette.base07}"
    "8=${lib.removePrefix "#" palette.base03}"
    "9=${lib.removePrefix "#" palette.base08}"
    "10=${lib.removePrefix "#" palette.base01}"
    "11=${lib.removePrefix "#" palette.base0A}"
    "12=${lib.removePrefix "#" palette.base0D}"
    "13=${lib.removePrefix "#" palette.base0E}"
    "14=${lib.removePrefix "#" palette.base0C}"
    "15=${lib.removePrefix "#" palette.base07}"
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
