---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- new buffer
    ["<C-n>"] = { "<cmd> enew <CR>", "new buffer" },

    ["<C-x>"] = { 
      function()
        require("nvchad_ui.tabufline").closeAllBufs()
      end,
      "close all buffer" 
    },
    ["<leader>cx"] = { 
      function()
        require("nvchad_ui.tabufline").closeAllBufs()
      end,
      "close all buffer" 
    },

    -- copilot start
    ["<leader>cp"] = { "<cmd> Copilot status <CR>", "copilot status" },
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
        require('hop').hint_lines_skip_whitespace({
          -- direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        })
      end,
      "HopLineStart"
    },
    ["<leader>m"] = {
      function()
        require('hop').hint_words()
      end,
      "HopWord"
    },
    ["<leader>k"] = {
      function()
        require('hop').hint_words({
          hint_position = require'hop.hint'.HintPosition.END
        })
      end,
      "HopWordEnd"
    },
  },
}



return M
