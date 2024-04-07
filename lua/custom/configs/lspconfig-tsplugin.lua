local on_attach = require( "plugins.configs.lspconfig" ).on_attach
local capabilities = require( "plugins.configs.lspconfig" ).capabilities

local lspconfig = require "lspconfig"

lspconfig.tsserver.setup({
  -- on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascript",
    -- "vue",
  },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
    typescript = {
      serverPath = "/usr/local/lib/node_modules/typescript/bin/tsserver",
      tsdk = "/usr/local/lib/node_modules/typescript/lib",
    },
  },
})
