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

  # Convert nix-colors palette to foot.ini [colors] format.
  # nix-colors normalizes palette values to bare RRGGBB (no '#'), which is
  # exactly what foot wants. Regular ANSI slots use the neutral gruvbox
  # variants, bright slots the bright ones, foreground is fg1 -- matching
  # Ghostty's built-in "Gruvbox Dark".
  footPalette = palette: {
    foreground = palette.base06;
    background = palette.base00;
    regular0 = palette.base00;
    regular1 = palette.base12;
    regular2 = palette.base14;
    regular3 = palette.base13;
    regular4 = palette.base16;
    regular5 = palette.base17;
    regular6 = palette.base15;
    regular7 = palette.base04;
    bright0 = palette.base03;
    bright1 = palette.base08;
    bright2 = palette.base0B;
    bright3 = palette.base0A;
    bright4 = palette.base0D;
    bright5 = palette.base0E;
    bright6 = palette.base0C;
    bright7 = palette.base07;
  };

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
