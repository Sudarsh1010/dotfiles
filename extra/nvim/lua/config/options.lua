-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.conceallevel = 1
opt.cmdheight = 0

opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 8
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.termguicolors = true

opt.pumblend = 0

opt.expandtab = true
opt.shiftwidth = 2
opt.wrap = true

vim.g.snacks_animate = false
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_cmp = "blink.cmp"
vim.g.lazyvim_rust_diagnostics = "bacon-ls"

-- for detecting the LSP root
vim.g.root_lsp_ignore = { "copilot" }
vim.g.lazyvim_prettier_needs_config = true

vim.g.root_spec = { "cwd" }
vim.g.omni_sql_no_default_maps = 1

opt.linebreak = true -- Wrap lines at word boundaries
opt.breakindent = true -- Indent wrapped lines to match original indentation
opt.showbreak = "↳ " -- String to show at the start of wrapped lines

opt.showtabline = 2 -- Always show tabline (like Helix's bufferline)
opt.cursorline = true -- Highlight cursor line (like Helix's inline diagnostics)
opt.showmode = false -- Hide mode in command line (lualine shows it)
opt.signcolumn = "yes" -- Always show sign column for diagnostics
opt.list = true -- Show whitespace characters
opt.listchars = { tab = "→ ", space = " ", nbsp = "⍽", eol = "⏎" } -- Whitespace characters

-- Indent guides
opt.listchars:append({ lead = "╎" })
opt.list = true

vim.g.lazyvim_blink_main = true

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
