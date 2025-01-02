local fn = vim.fn

-- Automatically install lazy
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

vim.g.mapleader = ' '

local plugins = {
  'nvim-lua/plenary.nvim', -- Useful lua functions used by lots of plugins
  'tpope/vim-abolish',
  'editorconfig/editorconfig-vim',
  'tpope/vim-endwise',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'kshenoy/vim-signature',
  'nvim-treesitter/playground',
  'jremmen/vim-ripgrep',
  'lervag/vimtex',
  'rcarriga/nvim-notify',

  require('plugins/treesitter'),
  require('plugins/autopairs'),
  require('plugins/tokyonight'),
  require('plugins/nvim-surround'),
  require('plugins/markdown-preview'),
  require('plugins/indent-line'),
  require('plugins/nvim-tree'),
  require('plugins/treesj'),
  require('plugins/ufo'),
  require('plugins/session-manager'),
  require('plugins/gitsigns'),
  require('plugins/ts-context-commentstring'),
  require('plugins/comment'),
  require('plugins/mini-align'),
  require('plugins/text-case'),
  require('plugins/telescope'),
  require('plugins/lualine'),
  require('plugins/bufferline'),
  require('plugins/colorizer'),
  require('plugins/flash'),
  require('plugins/tmux'),
  require('plugins/nvim-ts-autotag'),
  require('plugins/codeium'),

  -- cmp plugins
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  require('plugins/cmp'),

  -- LSP
  require('plugins/lsp'),
  'nvimtools/none-ls.nvim', -- for formatters and linters
  'ray-x/lsp_signature.nvim',
  'arkav/lualine-lsp-progress',
}

require("lazy").setup(plugins)
