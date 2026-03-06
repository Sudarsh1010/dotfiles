{ extraDir, ... }: {
  programs.neovim = {
    enable = true;
  };

  home.file.".config/nvim" = {
    # Path is relative to the file importing this module (modules/nvim.nix)
    # So ../../extra/nvim points to the root extra/nvim folder
    source = "${extraDir}/nvim";
    recursive = true; # Important: copies/symlinks the whole directory tree
  };
}
