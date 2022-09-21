-- lua configuration files
require('plugins-config/cmp')
require('plugins-config/closetag')
require('plugins-config/easy-align')
require('plugins-config/gitgutter')
require('plugins-config/indent-line')
require('plugins-config/nvim-tree')
require('plugins-config/telescope')

-- vim configuration files
vim.cmd('source' .. vim.fn.stdpath('config') .. '/lua/plugins-config/lightline.vim')
