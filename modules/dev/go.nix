{ pkgs, ... }: {
  # Install Go
  home.packages = with pkgs; [
    go
    gopls              # Go LSP
    go-tools           # Extra Go tools
    delve              # Debugger
    golangci-lint      # Linter aggregator
  ];

  # Set Go environment variables
  home.sessionVariables = {
    GOPATH = "$HOME/go";
    GOBIN = "$HOME/go/bin";
  };

  # Add Go bin to PATH
  home.sessionPath = [
    "$HOME/go/bin"
  ];
}
