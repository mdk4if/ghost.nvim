vim.api.nvim_create_user_command(
  'FollowLink',
  function()
    -- Copy the word under the cursor
    local word = vim.fn.expand("<cword>")
    
    -- Open Telescope and pass the copied word as the default search query
    require("telescope.builtin").find_files({
      cwd = "C:\\Users\\moham\\Stuff\\Notes",
      default_text = word, -- Automatically paste the copied word
    })
  end,
  { desc = "Copy word under cursor and search in Notes folder" }
)

