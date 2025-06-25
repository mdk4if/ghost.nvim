return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = {
      blue   = '#80a0ff',
      cyan   = '#79dac8',
      black  = '#080808',
      white  = '#c6c6c6',
      red    = '#ff5189',
      violet = '#d183e8',
      grey   = '#303030',
    }

    require('lualine').setup {
      options = {
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            mode = 4, -- Show full buffer names
            symbols = {
              modified = '[+]', -- Symbol for modified buffers
              alternate_file = '#', -- Symbol for alternate files
            },
            use_mode_colors = true, -- Use mode-specific colors
          }
        },
      },
      extensions = {}
    }

    -- Highlight active buffers
    vim.cmd [[
            highlight lualine_c_buffers_active guifg=#ffffff guibg=#005f87
            highlight lualine_c_buffers_inactive guifg=#aaaaaa guibg=#303030
            ]]
  end,
}
