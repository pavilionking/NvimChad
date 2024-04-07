local present, formatter = pcall(require, 'formatter')

local lspconfig = require'lspconfig'
local lspconfig_configs = require'lspconfig.configs'
local lspconfig_util = require 'lspconfig.util'

if present then

  local prettier = function()
    -- saas 2.0
    -- local path = '~/workspace/infynova/infynova-saas/prettier.config.js'

    -- normal
    local path = '~/workspace/infynova/.prettierrc'

    return {
      exe = 'prettier',
      args = { '--config ', path, '--stdin-filepath', vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
      args = { '--config-precedence', 'prefer-file', '--stdin-filepath', vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), },
      stdin = true,
    }
  end

  formatter.setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
      vue = { prettier },
      css = { prettier },
      less = { prettier },
      scss = { prettier },
      html = { prettier },
      javascript = { prettier },
      javascriptreact = { prettier },
      typescript = { prettier },
      typescriptreact = { prettier },
      markdown = { prettier },
      json = { prettier },
      jsonc = { prettier },
    },
  })

  -- 设置保存后自动格式化
  -- local group = vim.api.nvim_create_augroup('FormatAutogroup', { clear = true })
  -- vim.api.nvim_create_autocmd('BufWritePost', {
  --   command = 'FormatWrite',
  --   group = group,
  --   pattern = '*',
  -- })
end
