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

-- M.codeium = {
--   n = {
--     ["<leader>ce"] = { "<cmd> Codeium Enable <CR>", "codeium enable" },
--     ["<leader>cs"] = { "<cmd> Codeium Disable <CR>", "codeium disenable" },
--   },
--   i = {
--     ["<C-i>"] = {
--       function() vim.fn['codeium#Accept']() end, "Codeium Accept", { expr = true, silent = true },
--     },
--     ["<C-y>"] = {
--       function() vim.fn['codeium#CycleCompletions'](-1) end, "Codeium Previous", { expr = true, silent = true },
--     },
--     ["<C-p>"] = {
--       function() vim.fn['codeium#CycleCompletions'](1) end, "Codeium Next", { expr = true, silent = true },
--     },
--     ["<C-x>"] = {
--       function() vim.fn['codeium#Clear']() end, "Codeium clear", { expr = true, silent = true },
--     },
--   }
-- }

M.fittencode = {
  n = {
    ["<leader>fc"] = {
      function() require('fittencode').toggle_chat() end, "Fittencode toggle", { expr = true, silent = true }
    },
  },
  i = {
    ["<C-c>"] = {
      function() require('fittencode').dismiss_suggestions() end, "Fittencode dismiss suggestions ", { expr = true, silent = true },
    },
    ["<C-y>"] = {
      function() require('fittencode').revoke_line() end, "Fittencode accept line", { expr = true, silent = true },
    },
    ["<C-p>"] = {
      function() require('fittencode').accept_line() end, "Fittencode accept line", { expr = true, silent = true },
    },
  }
}

M.noice = {
  n = {
    ['<leader>nh'] = { function() require('noice').cmd('history') end, 'message history' },
    ['<leader>nl'] = { function() require('noice').cmd('last') end, 'message last' },
  }
}

M.SearchReplace = {
  n = {
    ["<leader>ro"] = {"<cmd> SearchReplaceSingleBufferOpen <CR>", "SearchReplace [o]pen"},
    ["<leader>rs"] = {"<cmd> SearchReplaceSingleBufferSelections <CR>", "SearchReplace [s]elction list"},
    ["<leader>rw"] = {"<cmd> SearchReplaceSingleBufferCWord <CR>", "SearchReplace [w]ord"},
    ["<leader>rW"] = {"<cmd> SearchReplaceSingleBufferOpen <CR>", "SearchReplace [W]ORD"},
    ["<leader>re"] = {"<cmd> SearchReplaceSingleBufferCExpr <CR>", "SearchReplace [e]xpr"},
    ["<leader>rf"] = {"<cmd> SearchReplaceSingleBufferCFile <CR>", "SearchReplace [f]ile"},
  }
}

return M
