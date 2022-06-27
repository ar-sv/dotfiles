--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
require('vars')
require('opts')
require('keys')
require('plugins')

-- SETUP PLUGINS
require('lualine').setup {
  options = {
    theme = 'dracula-nvim'
  }
}

-- require('nvim-autopairs').setup()
require('Comment').setup()
require('nvim-tree').setup()
require('gitsigns').setup()
require('Comment').setup()
require("bufferline").setup()
