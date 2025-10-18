local config = {
    transparent_background = true,
    auto_integrations = true,
}

local plugin_name = "catppuccin/nvim"

local colorscheme = {
    plugin_name,
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup(config)
        vim.cmd.colorscheme("catppuccin") -- Set the colorscheme
    end,
}

return { colorscheme }
