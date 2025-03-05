-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",
  theme_toggle = { "chadracula-evondev", "github_light" },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,

  header = {
    "     What shall we do today?    ",
    "",
    "                (`.        ,-,  ",
    "                ` `.    ,;' /   ",
    "                 `.  ,'/ .'     ",
    "                  `. X /.'      ",
    "         .-;--''--.._` ` (      ",
    "       .'            /   `      ",
    "     ,           ` '   Q '      ",
    "     ,         ,   `._    \\     ",
    "  ,.|         '     `-.;_'      ",
    "  :  . `  ;    `  ` --,.._;     ",
    "   ' `    ,   )   .'            ",
    "       `._ ,  '   /_            ",
    "          ; ,''-,;' ``-         ",
    "           ``-..__``--`         ",
  },
  --
  -- buttons = {
  --   { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
  --   { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
  --   -- more... check nvconfig.lua file for full list of buttons
  -- },
}

-- add custom lsps
M.mason = {
  pkgs = {
    "angular-language-server",
    "vtsls",
  },
}

return M
