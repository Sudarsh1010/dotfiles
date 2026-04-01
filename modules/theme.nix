{ lib, ... }:
{
  # Define custom color scheme using nix-colors format
  colorScheme = lib.mkForce {
    name = "gruvbox-dark-hard";
    variant = "dark";
    palette = {
      base00 = "#282828"; # bg0 (dark)
      base01 = "#3c3836"; # bg1
      base02 = "#504945"; # bg2
      base03 = "#665c54"; # bg3
      base04 = "#bdae93"; # grey1
      base05 = "#d5c4a1"; # grey2
      base06 = "#ebdbb2"; # fg1
      base07 = "#fbf1c7"; # fg0
      base08 = "#fb4934"; # red bright
      base09 = "#fe8019"; # orange bright
      base0A = "#fabd2f"; # yellow bright
      base0B = "#b8bb26"; # green bright
      base0C = "#8ec07c"; # aqua bright
      base0D = "#83a598"; # blue bright
      base0E = "#d3869b"; # purple bright
      base0F = "#d65d0e"; # faded orange
      base10 = "#141414"; # darkest bg
      base11 = "#0d0d0d"; # even darker
      base12 = "#cc241d"; # red neutral
      base13 = "#d79921"; # yellow neutral
      base14 = "#98971a"; # green neutral
      base15 = "#689d6a"; # aqua neutral
      base16 = "#458588"; # blue neutral
      base17 = "#b16286"; # purple neutral
    };
  };
}
