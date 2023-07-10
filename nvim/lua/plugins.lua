local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use { 'wbthomason/packer.nvim' } -- Have packer manage itself
	use { 'nvim-lua/plenary.nvim' } -- Useful lua functions used by lots of plugins
  use { 'tpope/vim-abolish' }
  use { 'jiangmiao/auto-pairs' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-fugitive' }
  use { 'Yggdroot/indentLine' }
  use { 'suan/vim-instant-markdown', run = 'sudo npm install -g instant-markdown-d' }
  use { 'numToStr/Comment.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'tpope/vim-repeat' }
  use { 'kshenoy/vim-signature' }
  use { 'tpope/vim-surround' }
  use { 'WillianGoncalves/nvcode-color-schemes.vim' }
  use { 'folke/tokyonight.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }
  use { 'jremmen/vim-ripgrep' }
  use { 'lervag/vimtex' }
  use { 'vimwiki/vimwiki' }
  use { 'ggandor/leap.nvim' }
  use { 'ThePrimeagen/harpoon' }
  use { 'Wansmer/treesj', requires = 'nvim-treesitter' }
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

	-- cmp plugins
  use { 'hrsh7th/cmp-cmdline' }

	-- LSP
  use { 'jose-elias-alvarez/null-ls.nvim' } -- for formatters and linters
  use { 'ray-x/lsp_signature.nvim' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

	-- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'arkav/lualine-lsp-progress'

  -- Session
  use {  'Shatur/neovim-session-manager' }

	-- Git
  use { 'lewis6991/gitsigns.nvim' }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
