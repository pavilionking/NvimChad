local M = {}

M.plugins = "vs_nvim.plugins" -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

M.mappings = require "core.mappings"

M.mappings = require("vs_nvim.mappings")

return M
