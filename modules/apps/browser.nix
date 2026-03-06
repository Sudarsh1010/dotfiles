{ config, pkgs, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;  # Privacy-focused Firefox fork
    
    # Native messaging hosts (for password managers, etc.)
    nativeMessagingHosts = with pkgs; [ ];

    profiles.sudarsh = {
      id = 0;
      name = "Sudarsh";
      isDefault = true;

      # ===== LibreWolf/Firefox Settings (about:config) =====
      settings = {
        # === Theme & Appearance ===
        "browser.theme.content-theme" = 1;  # Dark theme for web content
        "browser.theme.toolbar-theme" = 1;   # Dark theme for toolbar
        "browser.in-content.dark-mode" = true;
        "browser.theme.custom-colors" = true;

        # === Enable userChrome.css/userContent.css ===
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;

        # === Privacy (LibreWolf defaults, but explicit is better) ===
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.firstparty.isolate" = true;
        "network.cookie.cookieBehavior" = 1;  # Block third-party cookies
        "privacy.donottrackheader.enabled" = true;

        # === Security ===
        "browser.safebrowsing.downloads.enabled" = false;
        "browser.safebrowsing.malware.enabled" = false;
        "browser.safebrowsing.phishing.enabled" = false;

        # === Performance ===
        "browser.cache.disk.enable" = true;
        "browser.cache.memory.enable" = true;
        "browser.sessionstore.interval" = 60000;  # Save session every 60s

        # === UI Customization ===
        "browser.tabs.drawInTitlebar" = true;
        "browser.uidensity" = 0;  # Normal density
        "browser.compactmode.show" = true;

        # === Search ===
        "browser.search.defaultenginename" = "ddg";
        "browser.search.suggest.enabled" = false;
      };

      # ===== Extensions (Declarative) =====
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        # If NUR is not available, use pkgs.firefox-addons instead:
        # extensions = with pkgs.firefox-addons; [

        ublock-origin
        bitwarden
        darkreader
        stylus
      ];

      # ===== userChrome.css (LibreWolf UI Theming) =====
      userChrome = ''
        /* ===== ${config.colorScheme.name} Theme ===== */
        /* Generated from nix-colors palette */

        :root {
          /* Base colors from your theme */
          --theme-bg: ${config.colorScheme.palette.base00};
          --theme-bg-light: ${config.colorScheme.palette.base01};
          --theme-fg: ${config.colorScheme.palette.base05};
          --theme-fg-bright: ${config.colorScheme.palette.base06};
          --theme-accent: ${config.colorScheme.palette.base04};
          --theme-red: ${config.colorScheme.palette.base08};
          --theme-green: ${config.colorScheme.palette.base0B};
          --theme-yellow: ${config.colorScheme.palette.base0A};
          --theme-blue: ${config.colorScheme.palette.base0D};
          --theme-purple: ${config.colorScheme.palette.base0E};
          --theme-cyan: ${config.colorScheme.palette.base0C};
          --theme-gray: ${config.colorScheme.palette.base03};
        }

        /* ===== Main Toolbar ===== */
        #navigator-toolbox {
          background-color: var(--theme-bg) !important;
          color: var(--theme-fg) !important;
          border-bottom: 1px solid var(--theme-gray) !important;
        }

        /* ===== Tab Bar ===== */
        #TabsToolbar {
          background-color: var(--theme-bg) !important;
        }

        /* Active tab */
        .tabbrowser-tab[selected="true"] .tab-background {
          background-color: var(--theme-accent) !important;
          color: var(--theme-bg) !important;
        }

        .tabbrowser-tab[selected="true"] .tab-label-container {
          color: var(--theme-bg) !important;
        }

        /* Inactive tabs */
        .tabbrowser-tab:not([selected="true"]) .tab-background {
          background-color: var(--theme-bg-light) !important;
          color: var(--theme-fg) !important;
        }

        .tabbrowser-tab:not([selected="true"]) .tab-label-container {
          color: var(--theme-fg) !important;
        }

        /* Tab hover effect */
        .tabbrowser-tab:hover .tab-background {
          background-color: var(--theme-gray) !important;
        }

        /* ===== URL Bar ===== */
        #urlbar, #searchbar {
          background-color: var(--theme-bg-light) !important;
          color: var(--theme-fg) !important;
          border: 1px solid var(--theme-gray) !important;
        }

        #urlbar[focused="true"], #searchbar[focused="true"] {
          background-color: var(--theme-bg) !important;
          border-color: var(--theme-accent) !important;
        }

        #urlbar-input {
          color: var(--theme-fg) !important;
        }

        /* URL bar dropdown */
        .urlbarView {
          background-color: var(--theme-bg) !important;
          color: var(--theme-fg) !important;
        }

        .urlbarView-row:hover {
          background-color: var(--theme-bg-light) !important;
        }

        /* ===== Bookmarks Toolbar ===== */
        #PersonalToolbar {
          background-color: var(--theme-bg) !important;
          color: var(--theme-fg) !important;
        }

        #PersonalToolbar .toolbarbutton-1:hover {
          background-color: var(--theme-bg-light) !important;
        }

        /* ===== Sidebar ===== */
        #sidebar-box {
          background-color: var(--theme-bg) !important;
          color: var(--theme-fg) !important;
        }

        #sidebar-header {
          background-color: var(--theme-bg-light) !important;
          border-bottom: 1px solid var(--theme-gray) !important;
        }

        /* ===== Context Menus ===== */
        menupopup, panel {
          --panel-background: var(--theme-bg) !important;
          --panel-color: var(--theme-fg) !important;
          --panel-border-color: var(--theme-gray) !important;
        }

        menuitem:hover, menu:hover {
          background-color: var(--theme-bg-light) !important;
        }

        /* ===== Status Bar / Footer ===== */
        #statuspanel-label {
          background-color: var(--theme-accent) !important;
          color: var(--theme-bg) !important;
          border-color: var(--theme-accent) !important;
        }

        /* ===== Progress Bar ===== */
        #statuspanel .progress-bar {
          background-color: var(--theme-green) !important;
        }

        /* ===== Find Bar (Ctrl+F) ===== */
        .findbar-container {
          background-color: var(--theme-bg-light) !important;
          color: var(--theme-fg) !important;
        }

        /* ===== Notifications ===== */
        .notificationbox-stack {
          background-color: var(--theme-bg-light) !important;
          color: var(--theme-fg) !important;
        }

        /* ===== Hide Unnecessary UI Elements (Optional) ===== */
        /* Hide reader mode button */
        /* #reader-mode-button { display: none !important; } */

        /* Hide pocket button */
        /* #pocket-button { display: none !important; } */

        /* Hide home button */
        /* #home-button { display: none !important; } */

        /* ===== Compact Mode (Optional) ===== */
        /* Make tabs smaller */
        .tab-content {
          min-height: 32px !important;
        }
      '';

      # ===== userContent.css (About Pages & Web Content) =====
      userContent = ''
        /* ===== ${config.colorScheme.name} Web Content Theme ===== */

        /* ===== About New Tab / Home ===== */
        @-moz-document url("about:newtab"), url("about:home") {
          :root {
            --newtab-background-color: ${config.colorScheme.palette.base00} !important;
            --newtab-background-color-secondary: ${config.colorScheme.palette.base01} !important;
            --newtab-text-primary-color: ${config.colorScheme.palette.base05} !important;
            --newtab-primary-action-background: ${config.colorScheme.palette.base04} !important;
            --newtab-element-hover-color: ${config.colorScheme.palette.base01} !important;
            --newtab-element-active-color: ${config.colorScheme.palette.base02} !important;
          }

          /* Activity Stream */
          .outer-wrapper {
            background-color: var(--newtab-background-color) !important;
          }

          /* Search bar on new tab */
          .search-wrapper input {
            background-color: var(--newtab-background-color-secondary) !important;
            color: var(--newtab-text-primary-color) !important;
          }
        }

        /* ===== About Blank ===== */
        @-moz-document url("about:blank") {
          html {
            background-color: ${config.colorScheme.palette.base00} !important;
            color: ${config.colorScheme.palette.base05} !important;
          }
        }

        /* ===== About Config ===== */
        @-moz-document url("about:config") {
          :root {
            --in-content-page-background: ${config.colorScheme.palette.base00} !important;
            --in-content-page-color: ${config.colorScheme.palette.base05} !important;
            --in-content-box-background: ${config.colorScheme.palette.base01} !important;
            --in-content-box-border-color: ${config.colorScheme.palette.base03} !important;
          }
        }

        /* ===== About Addons ===== */
        @-moz-document url("about:addons") {
          :root {
            --in-content-page-background: ${config.colorScheme.palette.base00} !important;
            --in-content-page-color: ${config.colorScheme.palette.base05} !important;
          }
        }

        /* ===== About Preferences ===== */
        @-moz-document url("about:preferences"), url("about:settings") {
          :root {
            --in-content-page-background: ${config.colorScheme.palette.base00} !important;
            --in-content-page-color: ${config.colorScheme.palette.base05} !important;
            --in-content-box-background: ${config.colorScheme.palette.base01} !important;
          }
        }

        /* ===== Force Dark Mode on All Websites (Optional) ===== */
        /* This is handled by DarkReader extension, but you can enable here too */
        /*
        @media (prefers-color-scheme: dark) {
          :root {
            color-scheme: dark !important;
          }
        }
        */
      '';

      # ===== Search Engines =====
      search = {
        default = "ddg";
        force = true;  # Prevent changes
        engines = {
          bing.metaData.hidden = true;

          "ddg" = {
            urls = [{ template = "https://duckduckgo.com/"; }];
            iconUpdateURL = "https://duckduckgo.com/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
          };
          nix-packages = {
            name = "Nix Packages";
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };

          google.metaData.alias = "@g";
        };
      };
    };
  };
}
