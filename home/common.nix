{ username, pkgs, ... }: {
  imports = [
    ../modules/theme.nix
    ../modules/core/shell.nix
    ../modules/core/git.nix
    ../modules/core/nvim.nix
    ../modules/dev/default.nix
    ../modules/apps/default.nix
  ];

  home.packages = with pkgs; [ stremio-linux-shell zed-editor ];
  home.username = username;
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
  programs.home-manager.enable = true;
}
