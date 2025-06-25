return {
  "HakonHarnes/img-clip.nvim",
  event = { "FileType markdown" }, -- Lazy-load only for Markdown files
  opts = {
    default = {
      dir_path = "assets", -- Store images in 'assets' subfolder
      file_name = "%Y-%m-%d-%H-%M-%S", -- Timestamp-based file naming
      use_absolute_path = false, -- Relative paths for portability
      relative_to_current_file = true, -- Store images relative to current file
      prompt_for_file_name = true, -- Prompt for custom file name
      show_dir_path_in_prompt = true, -- Show directory in prompt
    },
    filetypes = {
      markdown = {
        template = "![$CURSOR]($FILE_PATH)", -- Markdown image syntax
        url_encode_path = true, -- Encode spaces and special chars in URLs
        drag_and_drop = {
          enabled = true, -- Support drag-and-drop in Markdown
          insert_mode = true, -- Insert image link in insert mode
        },
      },
    },
  },
  keys = {
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard", ft = "markdown" },
  },
  config = function(_, opts)
    -- Only setup for Markdown files
    if vim.bo.filetype == "markdown" then
      require("img-clip").setup(opts)
    end
    -- Autocommand to ensure setup runs for new Markdown buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        require("img-clip").setup(opts)
      end,
    })
  end,
}
