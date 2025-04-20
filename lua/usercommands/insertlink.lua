vim.api.nvim_create_user_command(
  'InsertLink',
  function()
    require("telescope.builtin").find_files({
      cwd = "C:\\Users\\moham\\Stuff\\Notes",
      attach_mappings = function(_, map)
        map("i", "<CR>", function(prompt_bufnr)
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")

          -- Get the selected entry
          local selection = action_state.get_selected_entry()
          local file_name = selection.value:match("([^/\\]+)%..+$") -- Extract file name without extension

          -- Close Telescope
          actions.close(prompt_bufnr)

          -- Insert the file name inside [[]] at the cursor position
          vim.api.nvim_put({ "[[" .. file_name .. "]]" }, "c", true, true)
        end)
        return true
      end,
    })
  end,
  { desc = "Insert link from Notes folder" }
)

