local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local table_key = { noremap = true, silent = true }

---- Global sets
vim.api.nvim_command('syntax enable')
opt.number = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.smarttab = true
opt.hidden = true
opt.ignorecase = true
auto_complete = true
opt.mouse = 'a'
opt.completeopt = {'menuone', 'noinsert', 'noselect'} 

---- Keybindings
g.mapleader = ','

-- Buffer
vim.api.nvim_set_keymap('', '<leader>z', ':bp<CR>', table_key)
vim.api.nvim_set_keymap('', '<leader>q', ':bp<CR>', table_key)
vim.api.nvim_set_keymap('', '<leader>x', ':bn<CR>', table_key)
vim.api.nvim_set_keymap('', '<leader>w', ':bn<CR>', table_key)
vim.api.nvim_set_keymap('', '<leader>c', ':bd<CR>', table_key)

-- NerdTREE
vim.api.nvim_set_keymap('', '<F2>', ':NERDTreeFind<CR>', table_key)
vim.api.nvim_set_keymap('', '<F3>', ':NERDTreeToggle<CR>', table_key)

-- FTerm
vim.api.nvim_set_keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', table_key)
vim.api.nvim_set_keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', table_key)

---- Plugins
require "paq" {
    'ryanoasis/vim-devicons';
    'preservim/nerdtree';
    'preservim/nerdtree';
    'tiagofumo/vim-nerdtree-syntax-highlight';
    'Xuyuanp/nerdtree-git-plugin';
    'scrooloose/nerdcommenter';
    'nvim-lualine/lualine.nvim';
    'kyazdani42/nvim-web-devicons';
    'github/copilot.vim';

    'neovim/nvim-lspconfig';
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-cmdline';
    'hrsh7th/nvim-cmp';
    'L3MON4D3/LuaSnip';
    'saadparwaiz1/cmp_luasnip';
    'williamboman/nvim-lsp-installer';

    'numToStr/FTerm.nvim';
}
            
-- NerdTREE
g.NEDTreeChDirMode = 2
g.NERDTreeShowBookmarks = 1
g.nerdtree_tabs_focus_on_files = 1
g.NERDTreeMapOpenInTabSilent = '<RightMouse>'
g.NERDTreeWinSize = 50

-- Lualine
require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},

    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
  extensions = {}
}

-- Nvim-cmp (completion written in Lua)

local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp'},
        { name = 'luasnip'},
    }, {
        { name = 'buffer'},
    }),
    vimsources = {
        {
            name = 'buffer',
            option = {
                get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end
            }
        }
    }

})

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LspInstaller
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    },
    max_concurrent_installers = 4,
})

-- FTerm

require'FTerm'.setup({
    border = 'single',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})
