----------------------Color Tools----------------------

local M = {}

--- RGB class for handling colors in the RGB color space.
-- This class provides methods for creating RGB objects, converting between color spaces,
-- and performing common operations on colors like mixing and comparing equality.
-- @classmod RGB
local RGB = {}
M.RGB = RGB
RGB.__index = RGB
RGB.__type = "RGB"

--- Creates a new RGB object.
-- @param r The red component (0-255).
-- @param g The green component (0-255).
-- @param b The blue component (0-255).
-- @return A new RGB object.
function RGB:new(r, g, b)
    if type(r) == "table" and r.r and r.g and r.b then
        return RGB:new(r.r, r.g, r.b)
    end
    local obj = {
        r = math.min(math.max(r, 0), 255),
        g = math.min(math.max(g, 0), 255),
        b = math.min(math.max(b, 0), 255),
    }
    setmetatable(obj, self)
    return obj
end

--- Converts the RGB color to a hexadecimal string.
-- @return A string representing the color in hexadecimal format, e.g., "#ff0000".
function RGB:to_hex()
    return string.format("#%02x%02x%02x", self.r, self.g, self.b)
end

function RGB:__tostring()
    return self:to_hex()
end

function RGB:__eq(other)
    return self.r == other.r and self.g == other.g and self.b == other.b
end

-- Method to determine whether it is an RGB object
function RGB:is_rgb()
    return self.__type == "RGB"
end

--- Converts a hexadecimal color string to an RGB object.
-- @param hex A string representing the color in hexadecimal format, e.g., "#ff0000".
-- @return An RGB object representing the color.
function RGB.from_hex(hex)
    hex = hex:gsub("#", "")
    return RGB:new(tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16))
end

local function rgb_to_xyz(rgb)
    local r = rgb.r / 255
    local g = rgb.g / 255
    local b = rgb.b / 255

    r = r > 0.04045 and ((r + 0.055) / 1.055) ^ 2.4 or r / 12.92
    g = g > 0.04045 and ((g + 0.055) / 1.055) ^ 2.4 or g / 12.92
    b = b > 0.04045 and ((b + 0.055) / 1.055) ^ 2.4 or b / 12.92

    r = r * 100
    g = g * 100
    b = b * 100

    local x = r * 0.4124 + g * 0.3576 + b * 0.1805
    local y = r * 0.2126 + g * 0.7152 + b * 0.0722
    local z = r * 0.0193 + g * 0.1192 + b * 0.9505

    return { x = x, y = y, z = z }
end

-- Convert RGB to XYZ
function RGB:to_xyz()
    return rgb_to_xyz(self)
end

-- Convert from XYZ to RGB
function RGB.from_xyz(xyz)
    local x = xyz.x / 100
    local y = xyz.y / 100
    local z = xyz.z / 100

    local r = x * 3.2406 + y * -1.5372 + z * -0.4986
    local g = x * -0.9689 + y * 1.8758 + z * 0.0415
    local b = x * 0.0557 + y * -0.2040 + z * 1.0570

    local function gamma_correction(channel)
        return channel > 0.0031308 and 1.055 * (channel ^ (1 / 2.4)) - 0.055 or channel * 12.92
    end

    r = gamma_correction(r) * 255
    g = gamma_correction(g) * 255
    b = gamma_correction(b) * 255

    return RGB:new(r, g, b)
end

local function lab_to_rgb(lab)
    -- Lab to XYZ
    local y = (lab.l + 16) / 116
    local x = lab.a / 500 + y
    local z = y - lab.b / 200

    local delta = 6 / 29
    local function f(t)
        return t > delta and t ^ 3 or (t - 16 / 116) / 7.787
    end

    x = 95.047 * f(x)
    y = 100.000 * f(y)
    z = 108.883 * f(z)

    -- XYZ to RGB
    return RGB.from_xyz({ x = x, y = y, z = z })
end

-- Lab to RGB
function RGB.from_lab(lab)
    lab_to_rgb(lab)
end

local function rgb_to_lab(rgb)
    local xyz = rgb_to_xyz(rgb)
    local x = xyz.x / 95.047
    local y = xyz.y / 100.000
    local z = xyz.z / 108.883

    local function f(t)
        return t > 0.008856 and t ^ (1 / 3) or (7.787 * t) + (16 / 116)
    end

    x = f(x)
    y = f(y)
    z = f(z)

    local l = (116 * y) - 16
    local a = 500 * (x - y)
    local b = 200 * (y - z)

    return { l = l, a = a, b = b }
end

-- Convert RGB to Lab
function RGB:to_lab()
    return rgb_to_lab(self)
end

-- Mix two RGB
function RGB:mix(other, t)
    local lab1 = self:to_lab()
    local lab2 = other:to_lab()
    local mixed_lab = {
        l = lab1.l * (1 - t) + lab2.l * t,
        a = lab1.a * (1 - t) + lab2.a * t,
        b = lab1.b * (1 - t) + lab2.b * t,
    }
    return RGB.from_lab(mixed_lab)
end

function M.get_highlight_hex(group, type)
    type = type or "fg"
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    if not hl[type] then
        return nil
    end
    return string.format("#%x", hl[type])
end

-- Function to get the RGB color of a highlight group
function M.get_highlight_rgb(group, type)
    type = type or "fg" -- Default to 'fg' (foreground) if no type is provided
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    if not hl[type] then
        return nil
    end
    local rgb = RGB:new(
        bit.rshift(bit.band(hl[type], 0xFF0000), 16), -- Extract the red component
        bit.rshift(bit.band(hl[type], 0x00FF00), 8), -- Extract the green component
        bit.band(hl[type], 0x0000FF) -- Extract the blue component
    )
    return rgb
end

-- Function to convert various inputs to an RGB color
function M.any_to_rgb(color)
    -- If input is already an RGB table, return it
    if type(color) == "table" and color.r and color.g and color.b then
        return RGB:new(color.r, color.g, color.b)
    elseif type(color) == "string" then
        -- If input is a hex string, convert it to RGB
        if color:sub(1, 1) == "#" then
            return RGB.from_hex(color)
        end
        -- If input is a highlight group, get its RGB value
        return M.get_highlight_rgb(color)
    end
end

-- Function to mix two colors
-- @param color1 The first color (in RGB table format)
-- @param color2 The second color (in RGB table format)
-- @param opt Options:
-- @param opt.ratio The ratio for mixing the two colors (optional, default is 0.5)
-- @param opt.ret The return type, "rgb" or "hex" (optional, default is "rgb")
-- @return The mixed color in the format specified by opt.ret
function M.mix_colors_via_rgb(color1, color2, ratio)
    color1 = M.any_to_rgb(color1) -- Convert the first color to RGB format
    color2 = M.any_to_rgb(color2) -- Convert the second color to RGB format
    if not color1 or not color2 then
        return nil
    end
    ratio = ratio or 0.5 -- Default mixing ratio is 0.5 (equal parts)
    local rgb = RGB:new( -- Create a new RGB object with the mixed
        math.floor(color1.r * ratio + color2.r * (1 - ratio)), -- Mix red components
        math.floor(color1.g * ratio + color2.g * (1 - ratio)), -- Mix green components
        math.floor(color1.b * ratio + color2.b * (1 - ratio)) -- Mix blue components
    )
    return rgb
end

-- Function to convert an RGB table to a hex string
function M.rgb_to_hex(color)
    if not M.check_rgb(color) then
        vim.notify("Invalid RGB color: " .. M.obj_inspect(color), vim.log.levels.ERROR)
        return nil
    end
    return string.format("#%02x%02x%02x", color.r, color.g, color.b) -- Format as hex
end

-- Function to check if a string is a valid hex color
function M.check_hex(hex)
    return hex:sub(1, 1) == "#" and #hex == 7 -- Must start with '#' and be 7 characters long
end

-- Function to check if a table is a valid RGB color
function M.check_rgb(rgb)
    local flag = type(rgb) == "table" and rgb.r and rgb.g and rgb.b
    flag = flag and type(rgb.r) == "number" and rgb.r >= 0 and rgb.r <= 255
    flag = flag and type(rgb.g) == "number" and rgb.g >= 0 and rgb.g <= 255
    flag = flag and type(rgb.b) == "number" and rgb.b >= 0 and rgb.b <= 255
    return flag -- Return true if all RGB values are valid
end

-- Function to convert a hex string to an RGB table
function M.hex_to_rgb(hex)
    -- Ensure the hex string is valid
    if not M.check_hex(hex) then
        vim.notify("Invalid hex color: " .. hex, vim.log.levels.ERROR)
        return nil
    end
    hex = hex:gsub("#", "") -- Remove the '#' character
    return RGB:new( -- Create a new RGB table with the hex values
        tonumber(hex:sub(1, 2), 16), -- Extract and convert red component
        tonumber(hex:sub(3, 4), 16), -- Extract and convert green component
        tonumber(hex:sub(5, 6), 16) -- Extract and convert blue component
    )
end

function M.color_difference_via_lab(color1, color2)
    color1, color2 = M.any_to_rgb(color1), M.any_to_rgb(color2)
    local lab1 = rgb_to_lab(color1)
    local lab2 = rgb_to_lab(color2)
    return math.sqrt((lab1.l - lab2.l) ^ 2 + (lab1.a - lab2.a) ^ 2 + (lab1.b - lab2.b) ^ 2)
end

function M.generate_distinct_color_via_lab(background_color, threshold)
    background_color = M.any_to_rgb(background_color)
    local function random_color()
        return { r = math.random(0, 255), g = math.random(0, 255), b = math.random(0, 255) }
    end
    local color
    repeat
        color = random_color()
    until M.color_difference_via_lab(background_color, color) > threshold
    return color
end

local function find_furthest_lab(lab)
    -- 假设 Lab 空间的对角线从 (0, 0, 0) 到 (100, 128, 128)
    -- Suppose the diagonal of Lab space goes from (0, 0, 0) to (100, 128, 128)
    local opposite_color_lab = {
        l = 100 - lab.l,
        a = 128 - lab.a,
        b = 128 - lab.b,
    }
    return opposite_color_lab
end

function M.get_contrast_color(color)
    color = M.any_to_rgb(color)
    return lab_to_rgb(find_furthest_lab(color))
end

-- Mix two LAB
local function mix_lab(lab1, lab2, t)
    return {
        l = lab1.l * (1 - t) + lab2.l * t,
        a = lab1.a * (1 - t) + lab2.a * t,
        b = lab1.b * (1 - t) + lab2.b * t,
    }
end

-- Mix two colors in Lab space
function M.mix_two_colors_via_lab(color1, color2, t)
    color1 = M.any_to_rgb(color1)
    color2 = M.any_to_rgb(color2)
    t = t or 0.5

    local color1_lab = rgb_to_lab(color1)
    local color2_lab = rgb_to_lab(color2)

    local mixed_lab = mix_lab(color1_lab, color2_lab, t)

    return lab_to_rgb(mixed_lab)
end

function M.change_brightness(color, amount)
    color = M.any_to_rgb(color)
    if not M.check_rgb(color) then
        return nil
    end
    return RGB:new(color.r + amount, color.g + amount, color.b + amount)
end

function M.change_saturation_via_lab(color, factor)
    color = M.any_to_rgb(color)
    local lab = rgb_to_lab(color)
    lab.a = lab.a + factor
    lab.b = lab.b + factor
    return lab_to_rgb(lab)
end

return M
