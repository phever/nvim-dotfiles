-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "basedpyright", "ruff", "tailwindcss", "emmet_language_server" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

local angular_project = vim.fs.root(0, "angular.json")
-- only enable angular if it's an angular project
if angular_project then
  lspconfig.angularls.setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.vtsls.setup {
  on_attach = function(client)
    -- disable vtsls rename in favor of angulars
    if angular_project then
      client.server_capabilities.renameProvider = false
    end
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
