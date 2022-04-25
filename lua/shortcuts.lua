local api = vim.api
local map = api.nvim_set_keymap
local table_key = { noremap = true, silent = true }

-- Key leader
vim.g.mapleader = ','

-- Bufferline
map('n', '<A-,>', ':BufferLineCyclePrev<CR>', table_key)
map('n', '<A-.>', ':BufferLineCycleNext<CR>', table_key)
map('n', '<A-<>', ':BufferLineMoveNext<CR>', table_key)
map('n', '<A->>', ':BufferLineMovePrev<CR>', table_key)
map('n', 'gD', ':BufferLinePickClose<CR>', table_key);

-- LuaTREE
api.nvim_set_keymap('', '<F2>', ':NvimTreeToggle<CR>', table_key)
map('', '<leader>r', ':NvimTreeRefresh<CR>', table_key)
map('', '<leader>n', ':NvimTreeFindFile<CR>', table_key)

-- Telescope
map('', '<leader>ff', ':Telescope find_files<CR>', table_key)
map('', '<leader>fg', ':Telescope live_grep<CR>', table_key)
map('', '<leader>fb', ':Telescope buffers<CR>', table_key)
map('', '<leader>fh', ':Telescope help_tags<CR>', table_key)

-- Errors
map('n', '<leader>xx', ':Trouble<CR>', table_key)
map('n', '<leader>xw', ':Trouble workspace_diagnostics<CR>', table_key)
map('n', '<leader>xd', ':Trouble document_diagnostics<CR>', table_key)
map('n', '<leader>xl', ':Trouble loclist<CR>', table_key)
map('n', '<leader>xq', ':Trouble quickfix<CR>', table_key)
map('n', 'gR', ':Trouble lsp_references<CR>', table_key)
map('n', '<leader>eq', ':TroubleClose<CR>', table_key)
