local overrides = require("custom.configs.overrides")
local fitten = require("custom.configs.fitten")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- {
  --   'github/copilot.vim',
  --   cmd = { "Copilot" },
  --   config = function()
  --     -- require('copilot-vim').setup()
  --   end,
  -- },
  --[[ {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    cmd = { "Codeium" },
    config = function()
      require("codeium").setup()
    end
  }, ]]
  --[[ {
    'Exafunction/codeium.vim',
    tag = '1.6.36',
    event = 'BufEnter',
    init = function()
      require("core.utils").load_mappings "codeium"
    end,
  }, ]]
  {
    'luozhiya/fittencode.nvim',
    event = "VeryLazy",
    config = function()
      require('fittencode').setup(fitten)
    end,
    init = function()
      require("core.utils").load_mappings "fittencode"
    end,
  },
  {
    'lukas-reineke/virt-column.nvim',
    tag = "v1.5.6",
    cmd = { "VirtColumnRefresh" },
    config = function()
      require("virt-column").setup(overrides.virt)
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    lazy = false,
    config = function() 
      local opt = require('custom.configs.todo-comment')
      require('todo-comments').setup(opt)
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  -- 格式化
  {
    'mhartington/formatter.nvim',
    event = 'BufWrite',
    init = function()
      require("core.utils").load_mappings "formatter"
    end,
    cmd = {"Format", "FormatWrite"},
    config = function()
      require('custom.configs.formatter')
    end,
  },
  {
    'kensyo/nvim-scrlbkun',
    config = function()
      require('scrlbkun').setup()
    end
  },
  {
    'sindrets/diffview.nvim',
    init = function()
      require('core.utils').load_mappings "diffview"
    end,
    cmd = {
      "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh"
    },
    config = function()
      require('diffview').setup()
    end
  },
  {
    'simrat39/symbols-outline.nvim',
    init = function()
      require("core.utils").load_mappings "SymbolsOutline"
    end,
    cmd = { 'SymbolsOutline' },
    config = function() 
      require('symbols-outline').setup(overrides.SymbolsOutline)
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    config = function ()
      require("noice").setup(overrides.noice)
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },
  {
    "roobert/search-replace.nvim",
    lazy = true,
    init = function()
      require('core.utils').load_mappings("SearchReplace")
    end,
    cmd = {
      "SearchReplaceSingleBufferVisualSelection",
      "SearchReplaceWithinVisualSelection",
      "SearchReplaceWithinVisualSelectionCWord",
      "SearchReplaceSingleBufferSelections",
      "SearchReplaceSingleBufferOpen",
      "SearchReplaceSingleBufferCWord",
      "SearchReplaceSingleBufferCWORD",
      "SearchReplaceSingleBufferCExpr",
      "SearchReplaceSingleBufferCFile",
      "SearchReplaceMultiBufferSelections",
      "SearchReplaceMultiBufferOpen",
      "SearchReplaceMultiBufferCWord",
      "SearchReplaceMultiBufferCWORD",
      "SearchReplaceMultiBufferCExpr",
      "SearchReplaceMultiBufferCFile",
    },
    config = function()
      require("search-replace").setup({
        -- optionally override defaults
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      })
    end,
  }
}

return plugins
