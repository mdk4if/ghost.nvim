if vim.fn.argc() == 0 then
    -- No arguments were provided, open in the specific directory
    vim.cmd("autocmd VimEnter * lcd C:\\Users\\moham\\Stuff")
end


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
vim.keymap.set("n", "<leader>fl", function () vim.cmd("FollowLink") end, {desc = "FollowLink"})


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
vim.keymap.set("i", "[[", function() vim.cmd("InsertLink") end, { desc = "Insert link" })

if vim.g.neovide then
  vim.g.neovide_refresh_rate = 144 -- Match your monitor’s refresh rate (e.g., 60, 120, 144)
  vim.g.neovide_no_vsync = true -- Enable VSync for smoother rendering
  vim.g.neovide_underline_stroke_scale = 1.0 -- Default underline thickness
end



--- Toggles a Markdown checkbox ([ ] or [x]) on the current line.
local function toggle_checkbox()
  -- Get the current line
  local line = vim.api.nvim_get_current_line()
  if not line then
    vim.notify("No line found", vim.log.levels.WARN)
    return
  end

  local new_line = line
  -- Patterns for checkboxes with optional leading spaces or hyphen
  local unchecked_pattern = "^(%s*-?%s*)%[ %]"
  local checked_pattern = "^(%s*-?%s*)%[x%]"

  if line:match(unchecked_pattern) then
    -- Replace [ ] with [x], preserving leading whitespace or markers
    new_line = line:gsub(unchecked_pattern, "%1[x]")
  elseif line:match(checked_pattern) then
    -- Replace [x] with [ ], preserving leading whitespace or markers
    new_line = line:gsub(checked_pattern, "%1[ ]")
  else
    vim.notify("No checkbox found on this line", vim.log.levels.INFO)
    return
  end

  -- Update the current line
  vim.api.nvim_set_current_line(new_line)
end

-- Keymap to toggle checkbox in normal mode
vim.keymap.set(
  "n",
  "<leader>tt",
  toggle_checkbox,
  { noremap = true, silent = true, desc = "Toggle Markdown checkbox" }
)
