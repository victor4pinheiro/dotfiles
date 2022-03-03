local api = vim.api
local table_key = { noremap = true, silent = true }

-- Key leader
vim.g.mapleader = ','

-- Bufferline
api.nvim_set_keymap('', '<leader>w', ':BufferLineCycleNext<CR>', table_key)
api.nvim_set_keymap('', '<leader>q', ':BufferLineCyclePrev<CR>', table_key)

api.nvim_set_keymap('', '<leader>a', ':BufferLineMoveNext<CR>', table_key)
api.nvim_set_keymap('', '<leader>s', ':BufferLineMovePrev<CR>', table_key)

api.nvim_set_keymap('', '<leader>be', ':BufferLineSortByExtension<CR>', table_key)
api.nvim_set_keymap('', '<leader>bd', ':BufferLineSortByDirectory<CR>', table_key)

api.nvim_set_keymap('', '<eader>gb', ':BufferLinePick<CR>', table_key)

-- LuaTREE
api.nvim_set_keymap('', '<F2>', ':NvimTreeToggle<CR>', table_key)
api.nvim_set_keymap('', '<leader>r', ':NvimTreeRefresh<CR>', table_key)
api.nvim_set_keymap('', '<leader>n', ':NvimTreeFindFile<CR>', table_key)

-- Telescope
api.nvim_set_keymap('', '<leader>ff', ':Telescope find_files<CR>', table_key)
api.nvim_set_keymap('', '<leader>fg', ':Telescope live_grep<CR>', table_key)
api.nvim_set_keymap('', '<leader>fb', ':Telescope buffers<CR>', table_key)
api.nvim_set_keymap('', '<leader>fh', ':Telescope help_tags<CR>', table_key)
