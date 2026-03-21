{ extraDir, ... }:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim" = {
    source = "${extraDir}/nvim";
    recursive = true;
  };
}
