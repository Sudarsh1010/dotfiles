{ pkgs, ... }: {
  home.packages = with pkgs; [
    python312

    # Python tools
    pipx                 # Install Python CLI tools in isolation
    poetry               # Dependency management
    basedpyright         # Python LSP
    black                # Code formatter
    ruff                 # Fast Python linter
    isort                # Import sorter
    
    # Useful Python CLI tools via pipx
    # (These will be installed to ~/.local/bin)
  ];

  # Add pipx binaries to PATH
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  # Set Python environment variables
  home.sessionVariables = {
    PYTHONUNBUFFERED = "1";
    PIP_NO_CACHE_DIR = "1";
  };
}
