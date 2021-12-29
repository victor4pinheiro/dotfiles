local api = vim.api  -- to configure lua api
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options
local table_key = { noremap = true, silent = true }

---- Global sets
api.nvim_command('syntax enable')
opt.number = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.smarttab = true
opt.hidden = true
opt.ignorecase = true
opt.mouse = 'a'
opt.wrap = false
opt.shiftround = true
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.wildmode = {'list', 'longest'}

---- Keybindings
g.mapleader = ','

-- Buffer
api.nvim_set_keymap('', '<leader>z', ':bp<CR>', table_key)
api.nvim_set_keymap('', '<leader>q', ':bp<CR>', table_key)
api.nvim_set_keymap('', '<leader>x', ':bn<CR>', table_key)
api.nvim_set_keymap('', '<leader>w', ':bn<CR>', table_key)
api.nvim_set_keymap('', '<leader>c', ':bd<CR>', table_key)

-- LuaTREE
api.nvim_set_keymap('', '<F2>', ':NvimTreeToggle<CR>', table_key)
api.nvim_set_keymap('', '<leader>r', ':NvimTreeRefresh<CR>', table_key)
api.nvim_set_keymap('', '<leader>n', ':NvimTreeFindFile<CR>', table_key)

-- FTerm
api.nvim_set_keymap('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', table_key)
api.nvim_set_keymap('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', table_key)

-- Glow
api.nvim_set_keymap('n', '<leader>p', ':Glow<CR>', table_key)

---- Plugins
require "paq" {
    'nvim-lualine/lualine.nvim';
    'kyazdani42/nvim-tree.lua';
    'kyazdani42/nvim-web-devicons';

    'neovim/nvim-lspconfig';
    'williamboman/nvim-lsp-installer';

    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-cmdline';
    'hrsh7th/nvim-cmp';
    'L3MON4D3/LuaSnip';
    'saadparwaiz1/cmp_luasnip';
    'onsails/lspkind-nvim';


    'numToStr/FTerm.nvim';
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
    "terrortylor/nvim-comment";
}

-- Tresitter
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    }
}

-- LuaTREE
require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = false,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    update_to_buf_dir = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    }
}

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

-- Nvim nvim-comment
require('nvim_comment').setup {
    comment_empty = false,
    line_mapping = "<leader>cl",
    operator_mapping = "<leader>c"
}

-- Nvim-cmp (completion written in Lua)
local cmp = require('cmp')
local lspkind = require('lspkind')

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
                get_bufnrs = function() return { api.nvim_get_current_buf() } end
            }
        }
    },
    formatting = {
        format = lspkind.cmp_format(),
    },
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
    local opts = {
        capabilities = capabilities
    }

    if server.name == "emmet_ls" then
        opts.filetypes = {"html", "xml", "javascript", "typescript", "json", "graphql", "yaml", "markdown", "php", "php-extras", "handlebars", "jade", "pug", "twig", "vue"}
    end

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
