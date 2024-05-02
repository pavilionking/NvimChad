---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- new buffer
    ["<C-n>"] = { "<cmd> enew <CR>", "new buffer" },

    ["<D-x>"] = { 
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "close all buffer" 
    },
    ["<leader>cx"] = { 
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "close all buffer" 
    },

    -- copilot start
    -- ["<leader>cp"] = { "<cmd> Copilot status <CR>", "copilot status" },

    ["<leader>tt"] = { "<cmd> TodoTelescope <CR>", "Todo Telescope" }
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
    ["<leader>l"] = {
      function()
        require('hop').hint_lines({
          -- direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        })
      end,
      "HopLine"
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

M.diffview = {
  n = {
    ["<leader>go"] = { "<cmd> DiffviewOpen <CR>", "git diff open" },
    ["<leader>gc"] = { "<cmd> DiffviewClose <CR>", "git diff close" },
  }
}

M.SymbolsOutline = {
  n = {
    ["<C-m>"] = { "<cmd> SymbolsOutline <CR>", "SymbolsOutline Toggle" }
  }
}

M.codeium = {
  n = {
    ["<leader>ce"] = { "<cmd> Codeium Enable <CR>", "codeium enable" },
    ["<leader>cs"] = { "<cmd> Codeium Disable <CR>", "codeium disenable" },
  },
  i = {
    ["<C-i>"] = {
      function() vim.fn['codeium#Accept']() end, "Codeium Accept", { expr = true, silent = true },
    },
    ["<C-y>"] = {
      function() vim.fn['codeium#CycleCompletions'](-1) end, "Codeium Previous", { expr = true, silent = true },
    },
    ["<C-p>"] = {
      function() vim.fn['codeium#CycleCompletions'](1) end, "Codeium Next", { expr = true, silent = true },
    },
    ["<C-c>"] = {
      function() vim.fn['codeium#Clear']() end, "Codeium Next", { expr = true, silent = true },
    },
  }
}

return M
