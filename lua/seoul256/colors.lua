local ct = require("seoul256.colortools")
local colors = {
    black = "#dfe0e0",
    blue = "#93b2b2",
    cyan = "#c3a769",
    gray = "#dfe0e0",
    green = "#678568",
    orange = "#67a9aa",
    paleblue = "#c78a69",
    pink = "#d0a39f",
    purple = "#c66d86",
    red = "#a07474",
    white = "#dfe0e0",
    yellow = "#c3a769",

    accent = "#ce8f6b",
    bg = "#4c4c4c",
    border = "#414863",
    contrast = "#d4d4d4",
    cursor = "#d8d8d8",
    disabled = "#414863",
    fg = "#dfe0e0",
    highlight = "#347474",
    indentline = "#555555",
    line_numbers = "#8a896a",
    string = "#93b2b2",
    text = "#565656",

    error = "#a07474",
    link = "#67a9aa",

    none = "NONE",
}

colors.hint = ct.change_saturation_via_lab(colors.line_numbers, 5):to_hex()
--colors.bg_l = "#545454",
colors.bg_l = ct.lighten(colors.bg, 8)
colors.bg_d = ct.lighten(colors.bg, -8)
colors.selection = ct.mix_two_colors_via_lab(colors.highlight, colors.bg, 0.4):to_hex()
-- Optional colors

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.seoul256_contrast == false then
    colors.sidebar = colors.bg
    colors.float = colors.bg
else
    colors.sidebar = colors.bg_l
    colors.float = colors.bg_l
end

return colors
