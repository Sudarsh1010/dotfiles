{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    # Rust toolchain via rustup (recommended for managing toolchains)
    rustup
    cargo-audit # Security auditing
    cargo-edit # Cargo subcommands for managing dependencies
    cargo-watch # Automatically rebuild on file changes
    cargo-nextest # Modern test runner
    # Make libiconv available so any stray `cargo install` from nvim/Mason
    # can link on darwin (avoids `ld: library not found for -liconv`).
    libiconv
  ];

  # Set environment variables for Rust
  home.sessionVariables = {
    CARGO_HOME = "$HOME/.cargo";
    RUSTUP_HOME = "$HOME/.rustup";
  };

  # Add Cargo bin to PATH (rustup installs binaries here)
  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];
}
