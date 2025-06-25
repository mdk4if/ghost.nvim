return {
  "OXY2DEV/markview.nvim",
  ft = { "markdown", "quarto", "rmd" }, -- Lazy-load for Markdown-related filetypes
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local is_neovide = vim.g.neovide or false -- Detect Neovide
    require("markview").setup({
      modes = { "n", "i", "c" }, -- Enable in normal, insert, and command modes
      hybrid_modes = { "i" }, -- Hybrid rendering in insert mode
      buf_ignore = { "help", "man", "terminal" }, -- Ignore additional buffer types
      latex = {
        enable = true,
        renderer = is_neovide and "canvas" or "textobjects", -- Use canvas for Neovide, textobjects for terminal
      },
      checkboxes = {
        enable = true,
        checked = { text = " " }, -- Custom checked icon
        unchecked = { text = " " }, -- Custom unchecked icon
      },
      tables = {
        enable = true,
        use_virt_lines = is_neovide, -- Virtual lines for better table rendering in Neovide
      },
      code_blocks = {
        enable = true,
        style = is_neovide and "fancy" or "simple", -- Fancy rendering in Neovide
        min_width = 60,
      },
      inline_codes = { enable = true },
      links = {
        enable = true,
        hyperlinks = { color = "#80a0ff" }, -- Custom link color
      },
      render_debounce = 50, -- Faster rendering for smoother Neovide experience
    })
  end,
}
