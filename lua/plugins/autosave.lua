return {
  "pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    execution_message = {
      message = function() return "Auto-saved at " .. os.date("%H:%M:%S") end,
      dim = 0.18,
      cleaning_interval = 1250, -- Clear message after 1.25 seconds
    },
    trigger_events = { "InsertLeave", "TextChanged" }, -- Events to trigger auto-save
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")
      return fn.getbufvar(buf, "&modifiable") == 1
        and utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon", "TelescopePrompt" })
    end,
    debounce_delay = 135, -- Delay to avoid excessive saves
  },
}
