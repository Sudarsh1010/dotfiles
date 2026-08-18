return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ---@type lspconfig.settings.vtsls
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = false },
              parameterNames = {
                enabled = "literals",
                suppressWhenArgumentMatchesName = true,
              },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
      },
    },
  },
}
