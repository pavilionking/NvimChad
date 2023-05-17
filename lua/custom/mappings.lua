---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- new buffer
    ["<leader>n"] = { "<cmd> enew <CR>", "new buffer" },

    -- copilot start
    ["<leader>b"] = { "<cmd> Copilot status <CR>", "copilot status" },
  },
}

M.hop = {
  n = {
    ["<leader>s"] = {
      function()
        require('hop').hint_patterns()
      end,
      "HopPattern"
    },
    ["<leader>j"] = {
      function()
        require('hop').hint_lines_skip_whitespace()
      end,
      "HopLineStart"
    },
    ["<leader>m"] = {
      function()
        require('hop').hint_words()
      end,
      "HopWord"
    },
  },
}



return M
