local overrides = require("custom.configs.overrides")

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

  {
    'github/copilot.vim',
    cmd = { "Copilot" },
    config = function()
      -- require('copilot-vim').setup()
    end,
  },
  {
    'lukas-reineke/virt-column.nvim',
    cmd = { "VirtColumnRefresh" },
    config = function()
      require("virt-column").setup(overrides.virt)
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() 
      require('todo-comments').setup()
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
    'lewis6991/satellite.nvim',
    cmd = { "SatelliteRefresh", "SatelliteEnable", "SatelliteDisable" },
    config = function()
      require('satellite').setup()
    end
  }
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

}

return plugins
