local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "phaazon/hop.nvim",
    branch = 'v2', -- optional but strongly recommended
    init = function()
      require('vs_nvim.utils').load_mappings "hop"
    end,
    cmd = { "HopLine", "HopLineStart", "HopWord", "HopPattern", "HopChar1", "HopChar2", "HopAnywhere" }, 
    config = function()
      require('hop').setup {
        keys = "etovxqpdygfblzhckisuranmj", 
      }
    end
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
  }
}

local config = require("vs_nvim.utils").load_config()
require("lazy").setup(plugins, config.lazy_nvim)
