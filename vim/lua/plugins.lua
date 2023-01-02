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

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here

	use { 'wbthomason/packer.nvim' } -- Have packer manage itself
	use { 'nvim-lua/plenary.nvim' } -- Useful lua functions used by lots of plugins
  use { 'tpope/vim-abolish' }
  use { 'jiangmiao/auto-pairs' }
  use { 'alvan/vim-closetag' }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'junegunn/vim-easy-align' }
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
  use { 'honza/vim-snippets' }
  use { 'tpope/vim-surround' }
  use { 'WillianGoncalves/nvcode-color-schemes.vim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'jremmen/vim-ripgrep' }
  use { 'lervag/vimtex' }
  use { 'vimwiki/vimwiki' }
  use { 'ggandor/leap.nvim' }
	--use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" })
	--use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" })
	--use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" })
	--use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	--use({ "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" })
	--use({ "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" })
	--use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
	--use({ "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
	--use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
	--use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })
	--use("folke/which-key.nvim")

	-- cmp plugins
	use { 'hrsh7th/nvim-cmp' } -- The completion plugin
	use { 'hrsh7th/cmp-buffer' } -- buffer completions
	use { 'hrsh7th/cmp-path' } -- path completions
	use { 'saadparwaiz1/cmp_luasnip' } -- snippet completions
	use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-cmdline' }
	--use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

	-- snippets
	use { 'L3MON4D3/LuaSnip' } -- snippet engine
	use { 'rafamadriz/friendly-snippets' } -- a bunch of snippets to use

	-- LSP
  use { 'williamboman/mason.nvim' } -- simple to use language server installer
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'neovim/nvim-lspconfig' } -- enable LSP
  use { 'jose-elias-alvarez/null-ls.nvim' } -- for formatters and linters
  use { 'ray-x/lsp_signature.nvim' }

	-- Telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

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
