local colors = require("seoul256.colors")
local ct = require("seoul256.colortools")

local M = {}

M.normal = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
    b = { fg = colors.title, bg = colors.active },
    c = { fg = colors.fg, bg = ct.change_brightness(colors.bg, -10):to_hex() },
}

M.insert = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
    b = { fg = colors.title, bg = colors.active },
}

M.visual = {
    a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
    b = { fg = colors.title, bg = colors.active },
}

M.replace = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
    b = { fg = colors.title, bg = colors.active },
}

M.command = {
    a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
    b = { fg = colors.title, bg = colors.active },
}

M.inactive = {
    a = { fg = colors.disabled, bg = colors.bg, gui = "bold" },
    b = { fg = colors.disabled, bg = colors.bg },
    c = { fg = colors.disabled, bg = colors.selection },
}

return M
