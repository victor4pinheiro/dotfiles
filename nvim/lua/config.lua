-- Completions and snippets
local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp'},
        { name = 'luasnip'},
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
    }, {
        { name = 'buffer' }
    }),
    formatting = {
        format = lspkind.cmp_format()
    },
})

cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
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

-- Language Server Protocol

local lsp_installer = require'nvim-lsp-installer'

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
    max_concurrent_installers = 4
})

-- Language parser

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    }
}

-- Comments

require'nvim_comment'.setup {
    comment_empty = false,
    line_mapping = "<leader>cl",
    operator_mapping = "<leader>c"
}

-- File explorer

require'nvim-tree'.setup {}

-- Fuzzy file finder

require'telescope'.setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
}

-- Auto-Pair closing brackets

local npairs = require'nvim-autopairs'

npairs.setup({
    check_ts = true,
})

-- Git

require'gitsigns'.setup {
    signcolumn = true
}

-- Status and Bufferline

---- Lualine
require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'omni',
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
    },
    tabline = {},
    extensions = {}
}

---- Bufferline
require'bufferline'.setup{
    options = {
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        separator_style = "bar",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        },
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
    }
}

-- Terminal

require'toggleterm'.setup{
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = "/bin/zsh"
}

-- Theme

vim.cmd[[colorscheme omni]]

-- Move

require'gomove'.setup {
  map_defaults = true,
  reindent = true,
  undojoin = true,
  move_past_end_col = false,
}

-- Colorizer

require 'colorizer'.setup()
