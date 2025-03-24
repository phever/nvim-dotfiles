-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for
---@type Base46Table
local M = {}
-- UI
M.base_30 = {
  white = "#D9E0EE",
  darker_black = "#191828",
  black = "#1e1e2e", --  nvim bg
  black2 = "#252434",
  one_bg = "#2d2c3c", -- real bg of onedark
  one_bg2 = "#363545",
  one_bg3 = "#3e3d4d",
  grey = "#474656",
  grey_fg = "#4e4d5d",
  grey_fg2 = "#555464",
  light_grey = "#605f6f",
  red = "#F38BA8",
  baby_pink = "#ffa5c3",
  pink = "#F5C2E7",
  line = "#45485a", -- for lines like vertsplit
  green = "#ABE9B3",
  vibrant_green = "#b6f4be",
  nord_blue = "#8bc2f0",
  blue = "#89B4FA",
  yellow = "#FAE3B0",
  sun = "#ffe9b6",
  purple = "#d0a9e5",
  dark_purple = "#c7a0dc",
  teal = "#B5E8E0",
  orange = "#fab387",
  cyan = "#94e2d5",
  statusline_bg = "#232232",
  lightbg = "#313244",
  pmenu_bg = "#ABE9B3",
  folder_bg = "#89B4FA",
  lavender = "#b4befe",
}

-- check https://github.com/chriskempson/base16/blob/master/styling.md for more info
M.base_16 = {
  base00 = "#1e1e2e", --base
  base01 = "#181825", --mantle
  base02 = "#313244", --surface0
  base03 = "#45475a", --surface1
  base04 = "#585b70", --surface2
  base05 = "#cdd6f4", --text
  base06 = "#f5e0dc", --rosewater
  base07 = "#b4befe", --lavender
  base08 = "#f38ba8", --red
  base09 = "#fab387", --peach
  base0A = "#f9e2af", --yellow
  base0B = "#a6e3a1", --green
  base0C = "#94e2d5", --teal
  base0D = "#89b4fa", --blue
  base0E = "#cba6f7", --mauve
  base0F = "#f2cdcd", --flamingo
}

-- OPTIONAL
-- overriding or adding highlights for this specific theme only
-- defaults/treesitter is the filename i.e integration there,

M.polish_hl = {
  ["@variable"] = { fg = M.base_30.lavender },
  ["@propery"] = { fg = M.base_30.teal },
  ["@variable.builtin"] = { fg = M.base_30.red },
}

-- set the theme type whether is dark or light
M.type = "dark" -- "or light"

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "catppuccin-mocha")

return M
