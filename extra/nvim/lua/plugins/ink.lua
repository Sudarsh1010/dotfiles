return {
  "ErickSenaGodinho/ink.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("ink").setup()
  end,
}
