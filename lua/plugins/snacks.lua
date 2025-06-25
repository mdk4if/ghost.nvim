return {
  "folke/snacks.nvim",
  priority = 1000, -- Load early for core functionality
  lazy = false,    -- Ensure plugin is always loaded
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },              -- Handle large files efficiently
    dashboard = {
      enabled = true,
      preset = {
        header = [[

                  ▄ ▄                     
              ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄       
              █ ▄ █▄█ ▄▄▄ █ █▄█ █ █       
           ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █       
         ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄    
         █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄  
       ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █  
       █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █  
           █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█      
                                          
      Knowledge before words and actions  
        ]]
      }
    },
    explorer = { 
      enabled = true,
      hidden = true,
    },             -- File explorer integration
    indent = { enabled = true },               -- Indentation guides
    input = { enabled = true },                -- Enhanced input handling
    notifier = {
      enabled = true,
      timeout = 3000,                         -- Notification timeout in ms
    },
    picker = { enabled = true, sources = {
      explorer = {
        focus = "input", auto_close = true
      }
    }
  },               -- Enable picker for fuzzy finding
    quickfile = { enabled = true },            -- Quick file access
    scope = { enabled = true },                -- Scope-based features
    scroll = { enabled = true },               -- Smooth scrolling
    statuscolumn = { enabled = true },         -- Custom status column
    words = { enabled = true },                -- Word navigation
    styles = {
      notification = {
        -- wo = { wrap = true }                -- Uncomment to wrap notifications
      }
    }
  },
  keys = {
    -- File Finding (Prefix: <leader>f)
    { "<leader>ff", function() require("snacks").picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() require("snacks").picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fr", function() require("snacks").picker.recent() end, desc = "Recent Files" },
    { "<leader>fb", function() require("snacks").picker.buffers() end, desc = "Find Buffers" },
    { "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config Files" },
    { "<leader>fp", function() require("snacks").picker.projects() end, desc = "Find Projects" },

    -- Git Operations (Prefix: <leader>g)
    { "<leader>gb", function() require("snacks").picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() require("snacks").picker.git_log() end, desc = "Git Commit Log" },
    { "<leader>gs", function() require("snacks").picker.git_status() end, desc = "Git Status" },
    { "<leader>gd", function() require("snacks").picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>ga", function() require("snacks").picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gf", function() require("snacks").picker.git_log_file() end, desc = "Git File Log" },
    { "<leader>gg", function() require("snacks").lazygit() end, desc = "Open Lazygit" },
    { "<leader>go", function() require("snacks").gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },

    -- Search Operations (Prefix: <leader>s)
    { "<leader>sg", function() require("snacks").picker.grep() end, desc = "Grep in Project" },
    { "<leader>sw", function() require("snacks").picker.grep_word() end, desc = "Grep Word/Selection", mode = { "n", "x" } },
    { "<leader>sb", function() require("snacks").picker.lines() end, desc = "Search Buffer Lines" },
    { "<leader>sB", function() require("snacks").picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sh", function() require("snacks").picker.help() end, desc = "Search Help Pages" },
    { "<leader>sk", function() require("snacks").picker.keymaps() end, desc = "Search Keymaps" },
    { "<leader>sc", function() require("snacks").picker.commands() end, desc = "Search Commands" },
    { "<leader>sC", function() require("snacks").picker.command_history() end, desc = "Command History" },
    { "<leader>sd", function() require("snacks").picker.diagnostics() end, desc = "Search Diagnostics" },
    { "<leader>sD", function() require("snacks").picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sm", function() require("snacks").picker.marks() end, desc = "Search Marks" },
    { "<leader>sj", function() require("snacks").picker.jumps() end, desc = "Search Jumps" },
    { "<leader>sl", function() require("snacks").picker.loclist() end, desc = "Search Location List" },
    { "<leader>sq", function() require("snacks").picker.qflist() end, desc = "Search Quickfix List" },
    { "<leader>su", function() require("snacks").picker.undo() end, desc = "Search Undo History" },
    { "<leader>si", function() require("snacks").picker.icons() end, desc = "Search Icons" },
    { "<leader>sM", function() require("snacks").picker.man() end, desc = "Search Man Pages" },
    { "<leader>sH", function() require("snacks").picker.highlights() end, desc = "Search Highlights" },
    { "<leader>sa", function() require("snacks").picker.autocmds() end, desc = "Search Autocommands" },
    { "<leader>sp", function() require("snacks").picker.lazy() end, desc = "Search Plugin Specs" },
    { "<leader>sr", function() require("snacks").picker.resume() end, desc = "Resume Last Search" },
    { "<leader>s/", function() require("snacks").picker.search_history() end, desc = "Search History" },
    { "<leader>cc", function() require("snacks").picker.colorschemes() end, desc = "Search Colorschemes" },

    -- LSP Operations (Prefix: <leader>l)
    { "<leader>ld", function() require("snacks").picker.lsp_definitions() end, desc = "Goto Definition" },
    { "<leader>lD", function() require("snacks").picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "<leader>lr", function() require("snacks").picker.lsp_references() end, nowait = true, desc = "References" },
    { "<leader>li", function() require("snacks").picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "<leader>lt", function() require("snacks").picker.lsp_type_definitions() end, desc = "Goto Type Definition" },
    { "<leader>ls", function() require("snacks").picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>lS", function() require("snacks").picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

    -- Buffer and Window Management (Prefix: <leader>b)
    { "<leader>bd", function() require("snacks").bufdelete() end, desc = "Delete Buffer" },
    { "<leader>br", function() require("snacks").rename.rename_file() end, desc = "Rename File" },
    { "<leader>be", function() require("snacks").explorer() end, desc = "File Explorer" },
    { "<leader>bs", function() require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },
    { "<leader>b.", function() require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },

    -- UI Toggles and Modes (Prefix: <leader>u)
    { "<leader>uz", function() require("snacks").zen() end, desc = "Toggle Zen Mode" },
    { "<leader>uZ", function() require("snacks").zen.zoom() end, desc = "Toggle Zoom Mode" },
    { "<leader>un", function() require("snacks").notifier.hide() end, desc = "Dismiss Notifications" },
    { "<leader>uN", function() require("snacks").notifier.show_history() end, desc = "Notification History" },

    -- Terminal and Navigation
    { "<C-t>", function() require("snacks").terminal() end, desc = "Toggle Terminal" },

    -- Neovim News
    {
      "<leader>nn",
      desc = "Neovim News",
      function()
        require("snacks").win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Debugging utilities
        _G.dd = function(...) require("snacks").debug.inspect(...) end
        _G.bt = function() require("snacks").debug.backtrace() end
        vim.print = _G.dd -- Override print for snacks debugging

        -- Toggle mappings (Prefix: <leader>t)
        require("snacks").toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
        require("snacks").toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
        require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tn")
        require("snacks").toggle.diagnostics():map("<leader>td")
        require("snacks").toggle.line_number():map("<leader>tl")
        require("snacks").toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>tc")
        require("snacks").toggle.treesitter():map("<leader>tT")
        require("snacks").toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>tb")
        require("snacks").toggle.inlay_hints():map("<leader>th")
        require("snacks").toggle.indent():map("<leader>ti")
        require("snacks").toggle.dim():map("<leader>tD")
      end,
    })
  end,
}
