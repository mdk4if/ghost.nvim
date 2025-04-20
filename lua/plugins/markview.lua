return {
  "OXY2DEV/markview.nvim",
  ft = "markdown",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {
    modes = { "n", "i", "c" },
    hybrid_modes = { "i" },
    buf_ignore = { "help", "man" },
    latex = { enable = true },
    checkboxes = { enable = true },
    tables = { enable = true },
  },
}
