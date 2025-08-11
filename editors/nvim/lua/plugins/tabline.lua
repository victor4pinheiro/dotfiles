local dependencies = {
    "nvim-tree/nvim-web-devicons"
}

local config = function()
    local tabline = require("mini.tabline")

    tabline.setup()
end

local tabline = {
    'echasnovski/mini.tabline',
    version = false,
    dependencies = dependencies,
    config = config
}

return { tabline }
