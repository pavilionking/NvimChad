local present, formatter = pcall(require, 'formatter')

if present then
  local prettier = function()
    return {
      exe = 'prettier',
      args = { '--config /Users/peii/workspace/infynova/.prettierrc', '--stdin-filepath', vim.fn.shellescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
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
