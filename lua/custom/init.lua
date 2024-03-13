-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
require('custom.autocmds')

-- vim.api.nvim_set_keymap('i', '<C-i>', 'copilot#Accept("\\<CR>")', {expr=true, silent=true})
