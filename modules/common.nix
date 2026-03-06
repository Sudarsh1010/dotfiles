{ pkgs, ... }: {
  home.packages = with pkgs; [
    fzf
    ripgrep       # For telescope/fzf
    fd            # For file finding
    vim
    bun
    wget
    curl
    jq
    htop
    tree
  ];
}
