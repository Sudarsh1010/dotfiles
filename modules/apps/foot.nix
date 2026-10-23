{ config, colorLib, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "IoskeleyMono Nerd Font Mono:size=12";
        pad = "10x8";
        line-height = "18";
      };
      colors = {
        alpha = 0.95;
        cursor = "1d2021 ebdbb2";
      }
      // colorLib.footPalette config.colorScheme.palette;
      mouse = {
        hide-when-typing = true;
      };
    };
  };
}
