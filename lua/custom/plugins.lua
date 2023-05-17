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
    'codota/tabnine-nvim', 
    build = "./dl_binaries.sh",
    config = function()
      require('tabnine').setup {
        disable_auto_comment=true,
        accept_keymap="<Tab>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 200,
        suggestion_color = {gui = "#808080", cterm = 244},
        exclude_filetypes = {"TelescopePrompt"},
        log_file_path = nil, -- absolute path to Tabnine log file
      } 
    end
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
  }
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

}

return plugins
