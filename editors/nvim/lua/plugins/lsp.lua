local setup = {}
local opts = {}
local dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
}

local lsp = {
    "mason-org/mason-lspconfig.nvim",
    opts = opts,
    dependencies = dependencies
}

return { lsp }
