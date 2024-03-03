local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- nvim-tree 自动关闭
-- autocmd("BufEnter", {
--   nested = true,
--   group = myAutoGroup,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--       vim.cmd("quit")
--     end
--   end,
-- })

-- 自动切换输入法，需要安装 im-select
autocmd("InsertLeave", {
  group = myAutoGroup,
  callback = require("custom.im-select").macInsertLeave,
})

autocmd("InsertEnter", {
  group = myAutoGroup,
  callback = require("custom.im-select").macInsertEnter,
})

-- ruler线
autocmd("BufReadPost", {
  group = myAutoGroup,
  callback = function()
    require('scrlbkun.components').enable_all()
  end
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- 用o换行不要延续注释
autocmd("BufEnter", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})
