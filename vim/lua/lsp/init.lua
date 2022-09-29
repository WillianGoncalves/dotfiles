require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = require('lsp.servers').servers_list
})
require('lsp.config')
require('lsp.handlers').setup()
require('lsp.null-ls')
