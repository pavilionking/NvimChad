---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "monekai",
  theme_toggle = { "monekai", "monekai" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "vs_nvim.plugins"

-- check core.mappings for table structure
M.mappings = require "vs_nvim.mappings"

return M