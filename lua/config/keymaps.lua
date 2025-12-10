-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Go to Left Window", remap = true})
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Go to Lower Window", remap = true})
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Go to Upper Window", remap = true})
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Go to Right Window", remap = true})

vim.keymap.set("n", "<C-Left", "<cmd>TmuxNavigateLeft<cr>", { desc = "", silent = true, noremap = true})
vim.keymap.set("n", "<C-Down>", "<cmd>TmuxNavigateDown<cr>", { desc = "", silent = true, noremap = true})
vim.keymap.set("n", "<C-Up>", "<cmd>TmuxNavigateUp<cr>", { desc = "", silent = true, noremap = true})
vim.keymap.set("n", "<C-Right>", "<cmd>TmuxNavigateRight<cr>", { desc = "", silent = true, noremap = true})
