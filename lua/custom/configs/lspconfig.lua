local on_attach = require( "plugins.configs.lspconfig" ).on_attach
local capabilities = require( "plugins.configs.lspconfig" ).capabilities

local lspconfig = require "lspconfig"
local util = require 'lspconfig.util'

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "jsonls",
  -- "eslint",
  -- "prismals",
  -- "clangd",
  -- "cssmodules_ls",
  "emmet_ls",
  "tailwindcss",
 
  -- "volar",  -- vue3 (deprecated)

  -- "tsserver", 
  -- "vuels", -- vue2
}
-- vue3和ts (volar 2.0)
require "custom.configs.lspconfig-tsplugin"

for _, lsp in ipairs( servers ) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
   }
end

-- lspconfig.pyright.setup { blabla}

