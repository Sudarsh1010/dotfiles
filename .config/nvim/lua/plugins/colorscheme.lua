return {
  {
    "RRethy/base16-nvim",
    name = "base16",
    lazy = 1000,
    config = function()
      require("base16-colorscheme").setup({
        base00 = "",
        base01 = "#121212",
        base02 = "#222222",
        base03 = "#333333",
        base04 = "#999999",
        base05 = "#c1c1c1",
        base06 = "#999999",
        base07 = "#c1c1c1",
        base08 = "#5f8787",
        base09 = "#aaaaaa",
        base0A = "#8c7f70",
        base0B = "#9b8d7f",
        base0C = "#aaaaaa",
        base0D = "#888888",
        base0E = "#999999",
        base0F = "#444444",
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "base16" },
  },

  -- modicator (auto color line number based on vim mode)
  {
    "mawkler/modicator.nvim",
    dependencies = "RRethy/base16-nvim",
    init = function()
      -- These are required for Modicator to work
      vim.o.cursorline = false
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {},
  },
}
