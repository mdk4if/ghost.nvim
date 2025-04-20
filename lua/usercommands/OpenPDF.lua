vim.api.nvim_create_user_command("OpenPDF", function()
  local oil = require("oil")
  local entry = oil.get_cursor_entry()
  local fname = entry and entry.name

  if not fname then
    vim.notify("No file under cursor", vim.log.levels.ERROR)
    return
  end

  -- Check if the file has a .pdf extension (case-insensitive)
  if fname:lower():match("%.pdf$") then
    -- Get the full path of the file
    local dir = oil.get_current_dir()
    local path = dir .. (dir:sub(-1) == "/" and "" or "/") .. fname
    if vim.fn.filereadable(path) ~= 1 then
      vim.notify("File not found: " .. path, vim.log.levels.ERROR)
      return
    end
    -- Escape the path for shell command
    local escaped_path = vim.fn.shellescape(path)
    -- Determine the platform and appropriate command
    local system = vim.loop.os_uname().sysname
    local cmd
    if system == "Linux" then
      cmd = "xdg-open " .. escaped_path .. " &"
    elseif system == "Darwin" then
      cmd = "open " .. escaped_path .. " &"
    elseif system == "Windows_NT" then
      cmd = 'start "" ' .. escaped_path
    else
      vim.notify("Unsupported platform: " .. system, vim.log.levels.ERROR)
      return
    end
    -- Execute the command and check for errors
    local success, result = pcall(vim.fn.system, cmd)
    if not success or vim.v.shell_error ~= 0 then
      vim.notify("Failed to open PDF: " .. (result or "unknown error"), vim.log.levels.ERROR)
    end
  else
    -- Fallback to default select action for non-PDF files
    oil.select()
  end
end, {
  desc = "Open PDF files in default PDF viewer from Oil buffer",
})
