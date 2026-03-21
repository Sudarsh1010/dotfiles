{ pkgs }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    userKeymaps = [
      # ===========================================
      # Pane Navigation (Ctrl-h/j/k/l) - Works everywhere
      # Also work in docks (terminal, project panel, search panel)
      # ===========================================

      # ===========================================
      # Split Panes (ss = vertical, sv = horizontal)
      # ===========================================
      {
        context = "vim_mode == normal && !menu";
        bindings = {
          "s s" = "pane::SplitRight";
          "s v" = "pane::SplitDown";
        };
      }

      {
        context = "vim_mode == normal && Editor";
        bindings = {
          "space c d" = "editor::ToggleInlineDiagnostics";
        };
      }

      # ===========================================
      # Tab Navigation (L/H, Tab/Shift-Tab)
      # ===========================================
      {
        context = "vim_mode == normal && !menu";
        bindings = {
          "shift-l" = "pane::ActivateNextItem";
          "shift-h" = "pane::ActivatePreviousItem";
          tab = "pane::ActivateNextItem";
          "shift-tab" = "pane::ActivatePreviousItem";
        };
      }

      # ===========================================
      # New Tab (te = tab edit)
      # ===========================================
      {
        context = "vim_mode == normal && !menu";
        bindings = {
          "t e" = "workspace::NewFile";
        };
      }

      # ===========================================
      # Terminal (Ctrl-/)
      # ===========================================
      {
        context = "Workspace || Editor || Dock || Terminal";
        bindings = {
          "ctrl-/" = "terminal_panel::Toggle";
        };
      }

      # ===========================================
      # Project Panel / File Tree
      # ===========================================
      # Toggle project panel from editor
      {
        context = "vim_mode == normal && !menu";
        bindings = {
          "space e" = "workspace::ToggleLeftDock";
          "space f f" = "file_finder::Toggle";
          "space space" = "file_finder::Toggle";
          "space f b" = "pane::ActivateNextItem";
          "space f shift-b" = "pane::ActivatePreviousItem";
        };
      }

      # Project panel navigation (vim-style)
      {
        context = "ProjectPanel && not_editing";
        bindings = {
          h = "project_panel::CollapseSelectedEntry";
          l = "project_panel::Open";
          j = "menu::SelectNext";
          k = "menu::SelectPrevious";
          o = "project_panel::Open";
          d = "project_panel::Delete";
          r = "project_panel::Rename";
          n = "project_panel::NewFile";
          "shift-n" = "project_panel::NewDirectory";
          y = "workspace::CopyPath";
          escape = "menu::Cancel";
        };
      }

      # ===========================================
      # Git Integration (Lazygit via terminal)
      # ===========================================
      {
        context = "vim_mode == normal && !menu";
        bindings = {
          "space g g" = [
            "task::Spawn"
            {
              task_name = "git";
              reveal_target = "center";
            }
          ];
        };
      }

      # ===========================================
      # Buffer/Tab Management
      # ===========================================
      {
        context = "vim_mode == normal && !menu";
        bindings = {
          "space b d" = "pane::CloseActiveItem";
          "space b b" = "pane::ActivateNextItem";
        };
      }

      # ===========================================
      # Search
      # ===========================================
      {
        context = "vim_mode == normal && !menu";
        bindings = {
          "space s s" = "outline::Toggle";
        };
      }

      # ===========================================
      # Window Management
      # ===========================================
      {
        context = "Workspace || (vim_mode == normal && !menu)";
        bindings = {
          "ctrl-w v" = "pane::SplitRight";
          "ctrl-w s" = "pane::SplitDown";
          "ctrl-w h" = "workspace::ActivatePaneLeft";
          "ctrl-w l" = "workspace::ActivatePaneRight";
          "ctrl-w k" = "workspace::ActivatePaneUp";
          "ctrl-w j" = "workspace::ActivatePaneDown";
          "ctrl-w q" = "pane::CloseActiveItem";
        };
      }

      # ===========================================
      # Quick Actions
      # ===========================================
      {
        context = "vim_mode == normal && !menu";
        bindings = {
          "space w" = "workspace::Save";
          "space q" = "pane::CloseActiveItem";
        };
      }
    ];
    userSettings = {
      telemetry = {
        diagnostics = true;
        metrics = false;
      };
      text_rendering_mode = "subpixel";
      document_symbols = "on";
      agent_servers = {
        opencode = {
          type = "custom";
          command = "opencode";
          args = [ "acp" ];
        };
      };
      session = {
        trust_all_worktrees = true;
      };
      ui_font_family = "Iosevka Nerd Font Propo";
      buffer_font_family = "Iosevka Nerd Font Propo";
      vim_mode = true;
      icon_theme = "Zed (Default)";
      base_keymap = "VSCode";
      ui_font_size = 16;
      buffer_font_size = 15;
      theme = {
        mode = "dark";
        light = "Gruvbox Light Soft";
        dark = "Kanagawa Dragon";
      };
      relative_line_numbers = "enabled";
      hide_mouse = "on_typing_and_movement";

      # Additional nvim-like settings
      tab_size = 2;
      soft_wrap = "editor_width";
      cursor_blink = false;
      scroll_beyond_last_line = "off";
      vertical_scroll_margin = 8;
      preferred_line_length = 100;
      use_autoclose = true;
      use_auto_surround = true;
      auto_indent = true;
      tabs = {
        file_icons = true;
        git_status = true;
      };
      project_panel = {
        dock = "left";
        default_width = 240;
        file_icons = true;
        folder_icons = true;
        git_status = true;
        hide_gitignore = false;
      };
      terminal = {
        font_family = "Iosevka Nerd Font Propo";
        font_size = 14;
        line_height = "comfortable";
        shell = {
          program = "fish";
        };
      };
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
      };
    };
    userTasks = [
      {
        "label" = "git";
        "command" = "lazygit";
        "use_new_terminal" = true;
      }
    ];
  };
}
