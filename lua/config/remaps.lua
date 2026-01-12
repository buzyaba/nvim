vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {})
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", {})
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", {})
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {})

vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", {})
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", {})
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", {})
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", {})

-- Disable highlight on ESC when searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set({"v", "n"}, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set({"v", "n"}, "<leader>p", '"+p', { desc = "Paste after from clipboard" })
vim.keymap.set({"v", "n"}, "<leader>P", '"+P', { desc = "Paste before from clipboard" })
