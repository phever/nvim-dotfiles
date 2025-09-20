-- create a variable to determine if some eslint file is found in the project root
local eslint_found = vim.fs.root(0, function(name)
  return name:match "eslint" ~= nil
end)

-- generally I use prettier, but contribute to some projects that use eslint
local eslint_prettier = function()
  if eslint_found then
    return { "eslint_d" }
  else
    return { "prettier" }
  end
end

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    htmlangular = { "prettier" },
    htmldjango = { "djlint" },
    python = { "ruff_fix", "ruff_format" },
    json = { "prettier" },
    javascript = eslint_prettier(),
    typescript = eslint_prettier(),
    javascriptreact = eslint_prettier(),
    typescriptreact = eslint_prettier(),
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
