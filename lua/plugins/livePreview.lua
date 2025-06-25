return {
  "brianhuster/live-preview.nvim",
  event = { "FileType markdown,html" }, -- Lazy-load for Markdown and HTML files
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    port = 8080, -- Default port for the live preview server
    browser = "default", -- Use system default browser
    auto_refresh = true, -- Automatically refresh on buffer write
    filetypes = { "markdown", "html" }, -- Restrict to specific filetypes
    commands = {
      start = "LivePreview start", -- Command to start the preview
      stop = "LivePreview close", -- Command to stop the preview
      pick = "LivePreview pick", -- Command to pick a file via Telescope
    },
    open_browser = true, -- Automatically open browser on start
  },
  keys = {
    {
      "<leader>wp",
      "<cmd>LivePreview pick<cr>",
      desc = "Live Preview: Pick file",
      ft = { "markdown", "html" },
    },
    {
      "<leader>ws",
      "<cmd>LivePreview start<cr>",
      desc = "Live Preview: Start server",
      ft = { "markdown", "html" },
    },
    {
      "<leader>wq",
      "<cmd>LivePreview close<cr>",
      desc = "Live Preview: Stop server",
      ft = { "markdown", "html" },
    },
  },
  config = function(_, opts)
    -- Only setup for supported filetypes
    if vim.tbl_contains({ "markdown", "html" }, vim.bo.filetype) then
      require("live-preview").setup(opts)
    end
    -- Autocommand to ensure setup for new buffers of supported filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "html" },
      callback = function()
        require("live-preview").setup(opts)
      end,
    })
  end,
}
