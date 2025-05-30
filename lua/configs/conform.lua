local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    htmlangular = { "prettier" },
    htmldjango = { "djlint" },
    python = { "ruff_fix", "ruff_format" },
    javascript = { "prettier" },
    json = { "prettier" },
    typescript = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
