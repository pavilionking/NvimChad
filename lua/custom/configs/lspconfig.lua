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
  -- "tsserver", 
  "prismals",
  -- "clangd",
  -- "cssmodules_ls",
  -- "emmet_ls",
  -- "tailwindcss",
 
  "volar",  -- vue3
  -- "vuels", -- vue2
}

for _, lsp in ipairs( servers ) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
   }
end

lspconfig.tsserver.setup({
  on_init = on_init,
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "typescript",
    "typescriptreact",
    "javascript",
    "javascriptreact",
    "vue",
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

--[[ lspconfig.volar.setup({
  init_options = {
    typescript = {
      serverPath = "/usr/local/lib/node_modules/typescript/bin/tsserver",
      tsdk = "/usr/local/lib/node_modules/typescript/lib",
    },
  },
  capabilities = capabilities,
  on_init = on_init,
  on_attach = on_attach,
  filetypes = {
    "vue",
  },
}) ]]

-- lspconfig.pyright.setup { blabla}

