local config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup()
end

local gitsigns = {
    "lewis6991/gitsigns.nvim",
    config = config
}

return { gitsigns }
