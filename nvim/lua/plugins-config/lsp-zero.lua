local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")

local servers_list = {
	"eslint",
	"ts_ls",
	-- To get solargraph to work, it is necessary to install the lsp with mason and the gem for the corresponding project's ruby version.
	-- Then it is necessary to create a symlink like this: ln -s $HOME/.rbenv/shims/solargraph $HOME/.local/share/nvim/mason/bin/solargraph
	"solargraph",
	"cssls",
	"cssmodules_ls",
	"bashls",
	"docker_compose_language_service",
	"jsonls",
	"sqlls",

	"rubocop",
	"diagnosticls",
}

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = servers_list,
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

-- Source: https://github.com/ray-x/lsp_signature.nvim#full-configuration-with-default-values
local signature_setup = {
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	hint_enable = false,
	hi_parameter = "LspSignatureActiveParameter",
	handler_opts = {
		border = "rounded",
	},
}

local on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- Code extracted from https://github.com/neovim/nvim-lspconfig
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gdt", "<cmd>tab split | lua vim.lsp.buf.definition()<cr>", bufopts)
	vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", bufopts)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
	vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", bufopts)
	vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
	vim.keymap.set("n", "]e", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
	require("lsp_signature").on_attach(signature_setup, bufnr)
end

lsp_zero.on_attach(on_attach)

lsp_zero.setup()

lsp_zero.set_sign_icons({
	error = "E",
	warn = "W",
	hint = "H",
	info = "I",
})

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		-- focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = " Diagnostics:",
		prefix = function(diagnostic, i)
			return string.format(" %d. ", i)
		end,
	},
})

local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	formatting = cmp_format,
	preselect = cmp.PreselectMode.Item,
	completion = {
		completeopt = "",
	},
	window = {
		documention = cmp.config.window.bordered(),
	},
	sources = {
		{ name = "nvim_lsp", priority = 100 },
		{ name = "luasnip", priority = 90 },
		{ name = "nvim_lua", priority = 80 },
		{ name = "buffer", priority = 20 },
		{ name = "path", priority = 10 },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-y>"] = cmp.mapping.scroll_docs(-4),
		["<C-e>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-x>"] = cmp.mapping.abort(),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp_action.tab_complete(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	preselect = "none",
	completion = {
		completeopt = "menu,menuone,noinsert,noselect",
	},
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	preselect = "none",
	completion = {
		completeopt = "menu,menuone,noinsert,noselect",
	},
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path", priority = 10 },
	}, {
		{ name = "cmdline", priority = 70 },
	}),
})
