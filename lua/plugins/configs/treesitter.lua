local options = {
  ensure_installed = { 
    "vim", 
    "lua", 
    "html", 
    "css", 
    "javascript", 
    "typescript", 
    "tsx", 
    "jsx", 
    "vue", 
    "json", 
    "scss", 
    "stylus", 
    "python",
    'bash',
    'c',
    'c_sharp',
    'comment',
    'cpp',
    'diff',
    -- 'dockerfile',
    'dot',
    'git_rebase',
    'gitcommit',
    'gitignore',
    'go',
    'graphql',
    'pug',
    'java',
    'jsdoc',
    'json5',
    -- 'regex',
    -- 'ruby',
    -- 'rust',
    'sql',
    -- 'yaml',
  },

  sync_install = false,
  ignore_install = { '' },

  highlight = {
    enable = true,
    use_languagetree = true,
    disable = { '' },
    additional_vim_regex_highlighting = true,
  },

  indent = { enable = true, disable = { 'yaml' } },
  autopairs = {
    enable = true,
  },
  --启用增量选择
  incremental_selection = {
      enable = true,
      keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          node_decremental = '<BS>',
          scope_incremental = '<TAB>'
      }
  },
}

return options
