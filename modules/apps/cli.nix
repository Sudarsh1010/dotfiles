{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    opencode
  ];

  # === Tmux Configuration ===
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";

    # Core settings from your config
    prefix = "C-s";
    mouse = true;
    escapeTime = 0;
    baseIndex = 1;
    shell = "${pkgs.fish}/bin/fish";

    # Your exact key bindings and config
    extraConfig = ''
      set -g status off

      # === Plugin Management (TPM) ===
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'aserowy/tmux.nvim'

      # === Vim-style pane navigation via tmux.nvim ===
      # tmux.nvim handles C-h/j/k/l automatically via Neovim integration
      # No need for manual is_vim checks - the plugin handles it

      # === Resize panes with Meta (Alt) + h/j/k/l ===
      bind-key -n 'M-h' resize-pane -L 1
      bind-key -n 'M-j' resize-pane -D 1
      bind-key -n 'M-k' resize-pane -U 1
      bind-key -n 'M-l' resize-pane -R 1

      # === Reload config ===
      bind-key r source-file ~/.config/tmux/tmux.conf \\; display-message "conf reloaded"

      # === TPM init (must be last) ===
      run "~/.tmux/plugins/tpm/tpm"
    '';
  };

  # === Ensure TPM exists (declarative management) ===
  # This fetches TPM from GitHub so it's available without manual cloning
  home.file.".tmux/plugins/tpm" = {
    source = pkgs.fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tpm";
      rev = "v3.1.0";
      sha256 = "18i499hhxly1r2bnqp9wssh0p1v391cxf10aydxaa7mdmrd3vqh9";
    };
    recursive = true;
  };

  # === Lazygit Configuration (Kanagawa Dragon theme) ===
  programs.lazygit = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      gui = {
        theme = {
          # Active/selected elements - use orange (base09) for warmth
          activeBorderColor = [
            config.colorScheme.palette.base09
            "bold"
          ];
          # Inactive borders - subtle comment color
          inactiveBorderColor = [ config.colorScheme.palette.base03 ];
          # Search highlight - bright green for visibility
          searchingActiveBorderColor = [
            config.colorScheme.palette.base0B
            "bold"
          ];
          # Options text - blue for clarity
          optionsTextColor = [ config.colorScheme.palette.base0D ];
          # Selected line background - slightly lighter bg
          selectedLineBgColor = [ config.colorScheme.palette.base02 ];
          # Cherry-picked commits
          cherryPickedCommitBgColor = [ config.colorScheme.palette.base01 ];
          cherryPickedCommitFgColor = [ config.colorScheme.palette.base0E ];
          # Unstaged changes - red/orange for attention
          unstagedChangesColor = [ config.colorScheme.palette.base08 ];
          # Default text - proper foreground color
          defaultFgColor = [ config.colorScheme.palette.base05 ];
        };

        authorColors = {
          "*" = config.colorScheme.palette.base04;
        };
      };
    };
  };
}
