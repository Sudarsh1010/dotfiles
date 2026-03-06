{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Use -bin variant for macOS compatibility
    # ghostty-bin
  ];
}
