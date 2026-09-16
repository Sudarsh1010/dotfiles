{ config, colorLib, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "IoskeleyMono Nerd Font Mono:size=12";
        pad = "8x4";
      };
      colors = {
        alpha = 0.95;
      }
      // colorLib.footPalette config.colorScheme.palette;
      mouse = {
        hide-when-typing = true;
      };
    };
  };
}
