-- vim.opt.list = true
--
-- require("ibl").setup()
local colors = {
    QuietHarbor = "#5F7278",
    StoneBlue = "#5B7B7A",
    SkyCaptain = "#5E5E5F",
    IndiaInk = "#4E545B",
    OceanDepths = "#5D737E",
    Sharkskin = "#5F5E62",
    BlueMirage = "#4C6A92",
}

local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    for name, color in pairs(colors) do
        vim.api.nvim_set_hl(0, name, { fg = color })
    end
end)

local highlight = {}
for name in pairs(colors) do
    table.insert(highlight, name)
end

require("ibl").setup { indent = { highlight = highlight } }

