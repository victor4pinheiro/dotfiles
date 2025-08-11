local cmd = vim.cmd
local utils = require("utils")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

---- Keymaps using the function
--- Source the file
utils.set_keymap("n", "<leader>so", cmd.so)
--- Explorer - netrw
utils.set_keymap("n", "<leader>po", cmd.Ex)
utils.set_keymap("n", "<leader>pc", cmd.Rex)
--- Buffer delete
utils.set_keymap("n", "<leader>bd", cmd.bd)
--- Write and quit
utils.set_keymap("n", "<leader>w", cmd.w)
utils.set_keymap("n", "<leader>q", cmd.q)
--- Remove highlight
utils.set_keymap("n", "<leader>noh", cmd.noh)

---- Buffers
-- Creation
utils.set_keymap("n", "<leader>vs", cmd.vs)
utils.set_keymap("n", "<leader>sp", cmd.sp)

-- Navigation
utils.set_keymap("n", "<leader>wh", "<C-W><C-H>")
utils.set_keymap("n", "<leader>wj", "<C-W><C-J>")
utils.set_keymap("n", "<leader>wk", "<C-W><C-K>")
utils.set_keymap("n", "<leader>wl", "<C-W><C-L>")

-- Moving windows
utils.set_keymap("n", "wmh", "<C-W><S-H>")
utils.set_keymap("n", "wmj", "<C-W><S-J>")
utils.set_keymap("n", "wmk", "<C-W><S-K>")
utils.set_keymap("n", "wml", "<C-W><S-L>")
