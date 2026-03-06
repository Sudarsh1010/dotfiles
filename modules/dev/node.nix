{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Node.js runtime (choose your preferred version)
    nodePackages.nodejs

    # Package managers
    pnpm
    yarn

    # Tooling
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages.eslint

    # Useful CLI tools
    nodePackages.http-server
    nodePackages.nodemon
  ];

  # Enable corepack for package manager management
  home.sessionVariables = {
    COREPACK_ENABLE_AUTO_PIN = "0";
  };
}
