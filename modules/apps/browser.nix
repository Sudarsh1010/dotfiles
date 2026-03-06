{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;  # Privacy-focused Firefox fork
    
    # Native messaging hosts (for password managers, etc.)
    # nativeMessagingHosts = with pkgs; [ ];

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
