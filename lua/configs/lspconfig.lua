local nvlsp = require "nvchad.configs.lspconfig"
require "lspconfig"

-- load defaults i.e lua_lsp
nvlsp.defaults()

-- lspconfig default servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = { "cssls", "ruff", "tailwindcss", "bashls", "eslint" }
vim.lsp.enable(servers)

-- enable Python typing inlay hints
vim.lsp.config("basedpyright", {
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
})
vim.lsp.enable "basedpyright"

-- If "angular.json" exists
local angular_project = vim.fs.root(0, "angular.json")

if angular_project then
  -- only enable angular if it's an angular project
  vim.lsp.config("angularls", {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable "angularls"
end

vim.lsp.config("vtsls", {
  on_attach = function(client, bufnr)
    -- disable vtsls rename in favor of angulars
    if angular_project then
      client.server_capabilities.renameProvider = false
    end
    -- enable inlay hints for typescript
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- add inlay hints settings
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },
})
vim.lsp.enable "vtsls"
