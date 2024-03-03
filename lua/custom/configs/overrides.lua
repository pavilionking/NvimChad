local M = {}

M.treesitter = {
  ensure_installed = {
    "markdown",
    "markdown_inline",
    'yaml',
    -- 'java',
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    -- "lua-language-server",
    -- "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "xmlformatter",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  view = {
    width = 45,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.virt = {
  virtcolumn = '100'
}

M.SymbolsOutline = {
  autofold_depth = 2,
}

return M
