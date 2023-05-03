dofile(vim.g.base46_cache .. "lsp")
require "nvchad_ui.lsp"

local M = {}
local utils = require "core.utils"

local lspconfig = require'lspconfig'
local lspconfig_configs = require'lspconfig.configs'
local lspconfig_util = require 'lspconfig.util'

local function get_ts_server_path(root_dir)
  local project_root = lspconfig_util.find_node_modules_ancestor(root_dir)

  local local_tsserverlib = project_root ~= nil
    and lspconfig_util.path.join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js')
  local global_tsserverlib = '~/.npm/lib/node_modules/typescript/lib/tsserverlibrary.js'

  if local_tsserverlib and lspconfig_util.path.exists(local_tsserverlib) then
    return local_tsserverlib
  else
    return global_tsserverlib
  end
end

-- return {
--   config = {
--     on_new_config = function(new_config, new_root_dir)
--       new_config.init_options.typescript.serverPath = get_ts_server_path(new_root_dir)
--     end,
--   },
-- }


-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

require'lspconfig'.tsserver.setup {}

require'lspconfig'.volar.setup {
  cmd = {'vue-language-server', '--stdio'},
  root_dir = lspconfig_util.root_pattern 'package.json',
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.serverPath = get_ts_server_path(new_root_dir)
  end,
  filetypes = { 'vue'},
  init_options = {
    typescript = {
      tsdk = "/usr/local/lib/node_modules/typescript/lib"
    },
    languageFeatures = {
      implementation = true, -- new in @volar/vue-language-server v0.33
      references = true,
      definition = true,
      typeDefinition = true,
      callHierarchy = true,
      hover = true,
      rename = true,
      renameFileRefactoring = true,
      signatureHelp = true,
      codeAction = true,
      workspaceSymbol = true,
      completion = {
        defaultTagNameCase = 'both',
        defaultAttrNameCase = 'kebabCase',
        getDocumentNameCasesRequest = false,
        getDocumentSelectionRequest = false,
      },
    }
  },
  -- filetypes = { 'vue' },
  
  -- root_dir = lspconfig_util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", "vite.config.js")
}

-- require'lspconfig'.vuels.setup{}

require("lspconfig").lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

-- require('cmp_tabnine.config'):setup({
--   max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = '..',
-- 	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
-- 	},
-- 	show_prediction_strength = false
-- })

-- local volar_cmd = {'vue-language-server', '--stdio'}
-- local volar_root_dir = lspconfig_util.root_pattern 'package.json'

-- lspconfig.volar.setup {
--   cmd = volar_cmd,
--   root_dir = volar_root_dir,
--   filetypes = { 'vue'},
--   init_options = {
--     typescript = {
--       tsdk = '/usr/local/lib/node_modules/typescript/lib'
--     },
--     languageFeatures = {
--       implementation = true, -- new in @volar/vue-language-server v0.33
--       references = true,
--       definition = true,
--       typeDefinition = true,
--       callHierarchy = true,
--       hover = true,
--       rename = true,
--       renameFileRefactoring = true,
--       signatureHelp = true,
--       codeAction = true,
--       workspaceSymbol = true,
--       completion = {
--         defaultTagNameCase = 'both',
--         defaultAttrNameCase = 'kebabCase',
--         getDocumentNameCasesRequest = false,
--         getDocumentSelectionRequest = false,
--       },
--     }
--   },
-- }

return M
