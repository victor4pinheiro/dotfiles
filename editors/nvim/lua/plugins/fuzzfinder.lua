local grep = {
    rg_opts = "--color=always --smart-case -g '!{.git,node_modules}/*'"
}

local options = {
    grep = grep,
    fzf_opts = {
        ["--cycle"] = true
    }
}

local config = function()
    local fzf_lua = require("fzf-lua")

    fzf_lua.setup(options)

    local utils = require("utils")

    utils.set_keymap("n", "<leader>?", fzf_lua.oldfiles)
    utils.set_keymap("n", "<leader>sb", fzf_lua.buffers)
    utils.set_keymap("n", "<leader>s/", fzf_lua.lgrep_curbuf)
    utils.set_keymap("n", "<leader>ss", fzf_lua.builtin)
    utils.set_keymap("n", "<leader>sf", fzf_lua.files)
    utils.set_keymap("n", "<leader>gf", fzf_lua.git_files)
    utils.set_keymap("n", "<leader>sh", fzf_lua.helptags)
    utils.set_keymap("n", "<leader>sw", fzf_lua.grep)
    utils.set_keymap("n", "<leader>sg", fzf_lua.live_grep_native)
    utils.set_keymap("n", "<leader>sk", fzf_lua.keymaps)
    utils.set_keymap("n", "<leader>sd", fzf_lua.diagnostics_workspace)
    utils.set_keymap("n", "<leader>sr", fzf_lua.resume)
end

local fuzzyfinder = {
    "ibhagwan/fzf-lua",
    config = config
}

return { fuzzyfinder }
