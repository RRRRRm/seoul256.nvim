local M = {}
local colors = require("seoul256/colors")

function M.setup()
    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.brown
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.light_gray
    vim.g.terminal_color_8 = colors.gray
    vim.g.terminal_color_9 = colors.light_red
    vim.g.terminal_color_10 = colors.light_green
    vim.g.terminal_color_11 = colors.yellow
    vim.g.terminal_color_12 = colors.light_blue
    vim.g.terminal_color_13 = colors.pink
    vim.g.terminal_color_14 = colors.light_cyan
    vim.g.terminal_color_15 = colors.white
end

return M
