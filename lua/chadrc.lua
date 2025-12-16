-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "gruvbox_light" },

  -- hl_override = {
  --   Comment = { italic = true },
  --   ["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,

  header = {
    "       Follow the white rabbit. ",
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
}

-- M.ui = {
--   tabufline = {
--     lazyload = false,
--   },
-- }

-- add custom lsps
M.mason = {
  pkgs = {
    "lua_lsp",
    "angular-language-server",
    "shellcheck",
    "debugpy",
  },
}

return M
