return {
  {
    "boganworld/crackboard.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crackboard").setup({
        session_key = "6eb49b94712005299cad2de8fdc4aef56bc4084d3a3b30c17260f06bc4e6fed3",
      })
    end,
  },
}
