{ colorLib, pkgs, extraDir, config, lib, username, ... }: {
  # === Fish Shell ===
  programs.fish = {
    enable = true;

    # Plugins
    plugins = [
      { name = "nvm"; src = pkgs.fishPlugins.nvm.src; }
    ];

    # Aliases (simple command replacements)
    shellAliases = {
      tmux = "tmux -u";
      ll = "eza -lha --icons=auto --sort=name --group-directories-first";
      l = "eza -lh --icons=auto";
      ls = "eza -1 --icons=auto";
      ld = "eza -lhD --icons=auto";
      lt = "eza --icons=auto --tree";
      mkdir = "mkdir -p";
    };

    # Abbreviations (Fish-specific: expand on space)
    shellAbbrs = {
      ".." = "zoxide ..";
      "..." = "zoxide ../..";
      ".3" = "zoxide ../../..";
      ".4" = "zoxide ../../../..";
      ".5" = "zoxide ../../../../..";
    };

    # Shell initialization (runs on every shell start)
    shellInit = ''
      # Disable greeting
      set -g fish_greeting

      # XDG base directory
      set -gx PATH ~/.nix-profile/bin /nix/var/nix/profiles/default/bin $PATH
    '';

    # Interactive initialization (runs only in interactive shells)
    interactiveShellInit = ''
      # Editor
      set -x EDITOR "nvim"

      # Custom oc function for opencode + tmux integration
      function oc
          set base_name (basename (pwd))
          set path_hash (echo (pwd) | md5 | cut -c1-4)
          set session_name "$base_name-$path_hash"

          function __oc_find_port
              set port 4096
              while test $port -lt 5096
                  if not lsof -i :$port >/dev/null 2>&1
                      echo $port
                      return 0
                  end
                  set port (math $port + 1)
              end
              echo 4096
          end

          set oc_port (__oc_find_port)
          set -x OPENCODE_PORT $oc_port

          if set -q TMUX
              opencode --port $oc_port $argv
          else
              set oc_cmd "OPENCODE_PORT=$oc_port opencode --port $oc_port $argv; exec fish"
              if tmux has-session -t "$session_name" 2>/dev/null
                  tmux new-window -t "$session_name" -c (pwd) "$oc_cmd"
                  tmux attach-session -t "$session_name"
              else
                  tmux new-session -s "$session_name" -c (pwd) "$oc_cmd"
              end
          end

          functions -e __oc_find_port
      end

      # Fastfetch on interactive shells
      if status --is-interactive && type -q fastfetch
          fastfetch
      end

      # SSH agent helper (if you have fish_ssh_agent installed)
      if type -q fish_ssh_agent
          fish_ssh_agent
      end
    '';
  };

  # === Programs that provide shell integrations ===

  # Starship prompt (declarative config)
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = "$all";
      palette = config.colorScheme.name;
      palettes.${config.colorScheme.name} = colorLib.starshipPalette config.colorScheme.palette;
    };
  };

  # Zoxide (directory jumper)
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd" # Replace cd with z automatically
    ];
  };

  # Eza (ls replacement)
  home.packages = with pkgs; [
    eza
    fzf
    fd
    ripgrep
    fastfetch
  ];

  home.file.".config/fastfetch" = {
    source = "${extraDir}/fastfetch";
    recursive = true;
  };

  # === PATH Management ===
  # Home Manager manages PATH via sessionPath.
  # We add custom paths here instead of hardcoding in fish.
  home.sessionPath = [
    "$HOME/bin"
    "$HOME/.bun/bin"
    "$HOME/go/bin"
    "$HOME/.cargo/bin"
    # NVM path is version-specific; better to init nvm in shellInit if needed
    "$HOME/.local/share/nvm/v24.14.0/bin"
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    "/usr/local/go/bin"
    "/opt/homebrew/opt/postgresql@18/bin"
  ];

  # === Environment Variables ===
  home.sessionVariables = {
    # Let Home Manager handle PATH composition
    # Custom vars
    DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";
    JAVA_HOME = "/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home";
    ANDROID_HOME = "$HOME/Library/Android/sdk";
    PNPM_HOME = "/Users/${username}/Library/pnpm";
    XDG_CONFIG_HOME = "$HOME/.config";
    CPPFLAGS = "-I/opt/homebrew/opt/openjdk/include";
  };

  # === Manage Fish theme file ===
  # If you want to symlink your theme declaratively:
  # xdg.configFile."fish/themes/kanagawa-dragon.fish".source = ../../extra/fish/kanagawa-dragon.fish;
}
