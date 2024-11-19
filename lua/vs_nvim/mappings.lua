local M = {}

local function move_cursor(direction)
  -- vim.fn.reg_recording() 返回当前正在录制的寄存器名称,为空表示没在录制
  -- vim.fn.reg_executing() 返回当前正在执行的寄存器名称,为空表示没在执行
  if vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '' then
    return 'g' .. direction
  else
    return direction
  end
end

M.general = {
  n = {
    ["<Esc>"] = { ":noh <CR>", "clear highlights" },

    ["r"] = { "<cmd> redo <CR>", "redo" },

    ["j"] = {
      function()
        return move_cursor('j')
      end,
      "move cursor j",
      opts = {expr = true, remap = true, nowait = true}
    },
    ["k"] = {
      function()
        return move_cursor('k')
      end,
      "move cursor j",
      opts = {expr = true, remap = true, nowait = true}
    },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>cy"] = { "<cmd> %y+ <CR>", "copy whole file" },

    ["zc"] = { ":call VSCodeNotify('editor.fold')<CR>", "fold", opts = { silent = true} },

    ["zo"] = { ":call VSCodeNotify('editor.unfold')<CR>", "fold", opts = { silent = true} },

    ["H"] = { ":call VSCodeNotify('workbench.action.previousEditor')<CR>", "previousEditor", opts = { silent = true} },

    ["L"] = { ":call VSCodeNotify('workbench.action.nextEditor')<CR>", "nextEditor", opts = { silent = true} },

    ["<leader>x"] = { ":call VSCodeNotify('workbench.action.closeActiveEditor')<CR>", "closeActiveEditor", opts = { silent = true} },

    ["<leader>cx"] = { ":call VSCodeNotify('workbench.action.closeAllEditor')<CR>", "closeAllEditor", opts = { silent = true} },
  }
}

M.hop = {
  plugin = true,
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


return M
