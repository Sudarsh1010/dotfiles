{ ... }:
{
  # Go itself is managed outside Nix; keep the user Go bin path for tools installed by `go install`.

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
