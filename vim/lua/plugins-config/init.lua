-- lua configuration files
require('plugins-config/cmp')
require('plugins-config/closetag')
require('plugins-config/easy-align')
require('plugins-config/indent-line')
require('plugins-config/nvim-tree')
require('plugins-config/telescope')
require('plugins-config/treesitter')
require('plugins-config/session-manager')
require('plugins-config/lualine')
require('plugins-config/bufferline')
require('plugins-config/gitsigns')
require('plugins-config/colorizer')
require('plugins-config/leap')

-- vim configuration files
vim.cmd('source' .. vim.fn.stdpath('config') .. '/lua/plugins-config/vimwiki.vim')
