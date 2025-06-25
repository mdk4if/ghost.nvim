-- Core Settings organized into logical groups
local opt = vim.opt

-- Backup and File Handling
opt.backup = false                          -- Disable backup files
opt.swapfile = false                        -- Disable swap files
opt.undofile = true                         -- Enable persistent undo
opt.writebackup = false                     -- Prevent editing if file is open elsewhere
opt.undodir = vim.fn.stdpath('data') .. '/undo' -- Centralized undo directory

-- Display and UI
opt.cmdheight = 1                           -- Command line height
opt.conceallevel = 0                        -- Show markdown symbols
opt.cursorline = true                       -- Highlight current line
-- opt.guifont = "FiraCode Nerd Font:h12"      -- Font for GUI Neovim
opt.number = true                           -- Show line numbers
opt.pumheight = 10                          -- Popup menu height
opt.relativenumber = true                   -- Enable relative line numbers
opt.scrolloff = 8                           -- Lines above/below cursor
opt.showmode = false                        -- Hide mode indicator
opt.showtabline = 2                         -- Always show tabline
opt.sidescrolloff = 8                       -- Columns left/right of cursor
opt.signcolumn = "yes"                      -- Always show sign column
opt.wrap = false                            -- Disable line wrapping
opt.termguicolors = true                    -- Enable 24-bit RGB colors
opt.laststatus = 3                          -- Global statusline

-- Editing and Text Behavior
opt.expandtab = true                        -- Tabs to spaces
opt.fileencoding = "utf-8"                  -- File encoding
opt.iskeyword:append "-"                    -- Hyphens as part of words
opt.shiftwidth = 2                          -- Indentation spaces
opt.smartindent = true                      -- Smart indenting
opt.tabstop = 2                             -- Spaces per tab
opt.softtabstop = 2                         -- Spaces for editing tabs
opt.whichwrap:append "<,>,[,],h,l"          -- Cursor wrap keys
opt.linebreak = true                        -- Wrap at word boundaries
opt.breakindent = true                      -- Indent wrapped lines

-- Search and Navigation
opt.hlsearch = true                         -- Highlight search matches
opt.incsearch = true                        -- Incremental search
opt.ignorecase = true                       -- Case-insensitive search
opt.smartcase = true                        -- Case-sensitive with uppercase

-- Interaction
opt.clipboard = "unnamedplus"               -- System clipboard
opt.completeopt = { "menuone", "noselect" } -- Completion menu
opt.mouse = "a"                             -- Enable mouse
opt.timeoutlen = 500                        -- Key mapping timeout (faster)
opt.updatetime = 100                        -- Faster updates
opt.ttimeoutlen = 50                        -- Key code timeout

-- Window Management
opt.splitbelow = true                       -- Horizontal splits below
opt.splitright = true                       -- Vertical splits right
opt.equalalways = true                      -- Equalize window sizes
opt.winminheight = 0                        -- Allow windows to shrink fully
opt.shell = "pwsh" 
