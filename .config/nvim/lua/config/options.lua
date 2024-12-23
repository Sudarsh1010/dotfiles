-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.conceallevel = 1
opt.cmdheight = 0

opt.ignorecase = true
opt.smartcase = true
opt.scrolloff = 8
opt.relativenumber = false
opt.clipboard = "unnamedplus"
opt.termguicolors = true

opt.pumblend = 0

opt.expandtab = false
opt.wrap = true

vim.g.snacks_animate = false
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.ai_cmp = false

-- for detecting the LSP root
vim.g.root_lsp_ignore = { "copilot" }

vim.g.root_spec = { "cwd" }
vim.g.omni_sql_no_default_maps = 1
vim.g.python3_host_prog = "/usr/bin/python"
