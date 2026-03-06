{ modulesDir, username, ... }: {
  # Home Manager needs a bit of information about you and the
  # path it should manage.
  home.username = username;
  home.homeDirectory = "/Users/${username}";

  # This value determines the Home Manager release that your
  # configuration is compatible with. It helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "25.11"; 

  # Allow unfree packages (common on macOS for apps like VSCode, Chrome)
  nixpkgs.config.allowUnfree = true;

  # Import modular configurations
  imports = [
    "${modulesDir}/theme.nix"

    # Core tools
    "${modulesDir}/core/shell.nix"
    "${modulesDir}/core/git.nix"
    "${modulesDir}/core/nvim.nix"
    "${modulesDir}/core/macos.nix"

    # Development environments
    "${modulesDir}/dev/default.nix"

    # Applications (GUI + CLI)
    "${modulesDir}/apps/default.nix"
    "${modulesDir}/apps/browser.nix"
    "${modulesDir}/apps/default.nix"
  ];

  # Install Home Manager itself to manage future updates
  programs.home-manager.enable = true;
}
