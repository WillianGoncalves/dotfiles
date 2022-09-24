require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'sumneko_lua', 'tsserver' }
})
require('lsp.config')
require('lsp.handlers').setup()
require('lsp.null-ls')
