-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- lspconfig default servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
local servers = { "cssls", "ruff", "tailwindcss", "emmet_language_server", "bashls", "djlsp" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- enable Python typing inlay hints
lspconfig.basedpyright.setup {
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
}

-- If "angular.json" exists
local angular_project = vim.fs.root(0, "angular.json")

if angular_project then
  -- only enable angular if it's an angular project
  lspconfig.angularls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.vtsls.setup {
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
}
