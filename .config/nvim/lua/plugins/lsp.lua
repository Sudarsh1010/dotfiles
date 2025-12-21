-- Disable "No information available" notification on hover
-- plus define border for hover window
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config
    or {
      border = {
        { "╭", "Comment" },
        { "─", "Comment" },
        { "╮", "Comment" },
        { "│", "Comment" },
        { "╯", "Comment" },
        { "─", "Comment" },
        { "╰", "Comment" },
        { "│", "Comment" },
      },
    }
  config.focus_id = ctx.method

  if not (result and result.contents) then
    return
  end

  local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)

  if vim.tbl_isempty(markdown_lines) then
    return
  end

  return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          mason = false,
          command = "vtsls",
          settings = {
            typescript = {
              -- Performance optimizations
              maxTsServerMemory = 16384, -- Increase memory limit to 16GB (MB)
              tsserver = {
                maxTsServerMemory = 16384,
                -- Use separate syntax server for better performance
                useSeparateSyntaxServer = true,
                -- Disable file watching for better performance
                watchOptions = {
                  watchFile = "useFsEvents",
                  watchDirectory = "useFsEvents",
                  fallbackPolling = "dynamicPriority",
                  synchronousWatchDirectory = true,
                },
              },
              -- Disable expensive features
              suggest = {
                -- Reduce suggestion overhead
                includeCompletionsForModuleExports = false,
                includeCompletionsForImportStatements = false,
              },
              -- Disable inlay hints (you already have these disabled)
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
              -- Reduce diagnostic overhead
              diagnostics = {
                -- Only show errors, not warnings/info
                ignoredCodes = {},
              },
              -- Disable some heavy features
              implementationsCodeLens = { enabled = false },
              referencesCodeLens = { enabled = false },
              -- Optimize imports
              includePackageJsonAutoImports = "off",
              preferences = {
                -- Faster import resolution
                importModuleSpecifier = "relative",
                includeCompletionsForModuleExports = false,
                includeCompletionsForImportStatements = false,
              },
            },
            javascript = {
              -- Same optimizations for JavaScript
              suggest = {
                includeCompletionsForModuleExports = false,
                includeCompletionsForImportStatements = false,
              },
              preferences = {
                importModuleSpecifier = "relative",
                includeCompletionsForModuleExports = false,
                includeCompletionsForImportStatements = false,
              },
            },
            -- Global vtsls settings
            vtsls = {
              -- Enable experimental features for better performance
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
          },
          -- Additional LSP client optimizations
          flags = {
            debounce_text_changes = 150, -- Debounce changes
          },
          -- Reduce server startup overhead
          init_options = {
            preferences = {
              -- Disable automatic type acquisition
              disableAutomaticTypingAcquisition = true,
            },
          },
        },

        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false,
                compositeLiteralFields = false,
                compositeLiteralTypes = false,
                constantValues = false,
                functionTypeParameters = false,
                parameterNames = false,
                rangeVariableTypes = false,
              },
            },
          },
        },
      },
    },
  },
}
