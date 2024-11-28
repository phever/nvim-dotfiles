-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "pyright", "ruff", "tailwindcss", "vtsls" }
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
local mason_angular_path = "~/.local/share/nvim/mason/packages/angular-language-server"
local _ = require "mason-core.functional"
local path = require "mason-core.path"

local append_node_modules = _.map(function(dir)
  return path.concat { dir, "node_modules" }
end)

local function mk_angularls_cmd(cwd)
  return {
    "ngserver",
    "--stdio",
    "--tsProbeLocations",
    table.concat(append_node_modules { mason_angular_path, cwd }, ","),
    "--ngProbeLocations",
    table.concat(append_node_modules { mason_angular_path, cwd }, ","),
  }
end

lspconfig.angularls.setup {
  -- Set angular command to search mason installation and current working directory
  cmd = mk_angularls_cmd(vim.loop.cwd()),
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = mk_angularls_cmd(new_root_dir)
  end,
  on_attach = nvlsp.on_attach(function(client)
    --HACK: disable angular renaming capability due to duplicate rename popping up
    client.server_capabilities.renameProvider = false
  end),
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
