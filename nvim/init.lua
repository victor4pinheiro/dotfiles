local api = vim.api  -- to configure lua api
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

---- Global sets
api.nvim_command('syntax enable')
opt.termguicolors = true
opt.number = true
opt.autoindent = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.expandtab = true
opt.smarttab = true
opt.hidden = true
opt.ignorecase = true
opt.mouse = 'a'
opt.wrap = false
opt.shiftround = true
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.wildmode = {'list', 'longest'}

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Plugins
require('plugins')

-- Shortcuts
require('shortcuts')

-- Config Plugins
require('config')

-- Languages

---- HTML
cmd[[autocmd FileType html setlocal shiftwidth=4 tabstop=4]]

---- Python
cmd[[autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4]]

---- Java
cmd[[autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4]]

---- C
cmd[[autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4]]
