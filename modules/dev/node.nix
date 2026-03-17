{ pkgs, ... }: {
  home.packages = with pkgs; [
 ];

  # Enable corepack for package manager management
  home.sessionVariables = {
    COREPACK_ENABLE_AUTO_PIN = "0";
  };
}
