return require('packer').startup(function()
    -- Startup
    use 'lewis6991/impatient.nvim'

    -- Plugin management
    use 'wbthomason/packer.nvim'

    -- Language Server Protocol
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Language parser
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Rainbow brackets
    use 'p00f/nvim-ts-rainbow'

    -- Comments
    use 'terrortylor/nvim-comment'

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        }
    }

    -- Fuzzy file finder
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    --  Completion and snippets
    use {
        'onsails/lspkind-nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip'
    }

    -- Auto-Pair closing brackets
    use 'windwp/nvim-autopairs'

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- Status and bufferline
    use {
        'nvim-lualine/lualine.nvim',
        'akinsho/bufferline.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Terminal
    use 'akinsho/toggleterm.nvim'

    -- Theme
    use 'getomni/neovim'

    -- Scroll
    use 'karb94/neoscroll.nvim'

    -- Move lines
    use 'booperlv/nvim-gomove'

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'
end)
