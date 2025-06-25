return {
  'folke/noice.nvim',
  event = 'VeryLazy', -- Lazy load on Neovim's idle event
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = {
    -- Basic configuration options
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    presets = {
      bottom_search = true, -- Use a classic bottom cmdline
      command_palette = true, -- Position the cmdline and popupmenu together
      long_message_to_split = true, -- Long messages to split window
      inc_rename = false, -- Enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- Add a border to hover docs and signature help
    },
  },
  config = function(_, opts)
    -- Safe require to handle potential errors
    local ok, noice = pcall(require, 'noice')
    if not ok then
      vim.notify('Failed to load noice.nvim: ' .. tostring(noice), vim.log.levels.ERROR)
      return
    end

    -- Setup with provided options
    noice.setup(opts)

    -- Optional: Add keymaps
    vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', {
      desc = 'Dismiss Noice messages',
      silent = true,
    })
  end,
}
