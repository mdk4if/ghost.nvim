local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<leader>e", ":Oil<cr>", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Press jk fast to enter
vim.keymap.set("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope Maps
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<cr>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<cr>", { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<cr>", { desc = 'Telescope buffers' })

-- Telescope for searching notes
vim.keymap.set("n", "<leader>nf", function() require("telescope.builtin").find_files({ cwd = "C:\\Users\\moham\\Stuff\\Notes" }) end, { desc = "Find notes" })
vim.keymap.set("n", "<leader>ng", function() require("telescope.builtin").live_grep({ cwd = "C:\\Users\\moham\\Stuff\\Notes" }) end, { desc = "Search notes content" })
vim.keymap.set("i", "[[", function() vim.cmd("InsertLink") end, { desc = "Insert link" })
vim.keymap.set("n", "<leader>fl", function () vim.cmd("FollowLink") end, {desc = "FollowLink"})

-- open nvim configuration file
vim.keymap.set("n", "<leader>cf", ":e $MYVIMRC<cr>", {desc = "configure nvim"})

-- close current buffer
vim.keymap.set("n", "<leader>x", ":bd<cr>", {desc = "close current buffer"})
vim.keymap.set("n", "<leader>po", function () vim.cmd("OpenPDF") end, {desc = "Open Pdf in browser"} )
vim.keymap.set("n", "<leader>p", ":PasteImage<cr>", { desc = "Paste image from system clipboard"})

vim.keymap.set("n", "<leader>nf", function()
  vim.ui.input({ prompt = "Enter filename: " }, function(filename)
    if filename then
      vim.cmd("edit " .. filename)
    end
  end)
end, { desc = "Open new file" })
