local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- Source: https://github.com/ray-x/lsp_signature.nvim#full-configuration-with-default-values
local signature_setup = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  hint_enable = false,
  hi_parameter = 'Search',
  handler_opts = {
    border = "rounded"
  }
}

function show_docs()
  if not vim.lsp.buf.signature_help() then
    vim.lsp.buf.hover()
  end
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- Code extracted from https://github.com/neovim/nvim-lspconfig
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gdt', '<cmd>tab split | lua vim.lsp.buf.definition()<cr>', bufopts)
  vim.keymap.set('n', 'K', show_docs, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', ']e', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
  require "lsp_signature".on_attach(signature_setup, bufnr)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(require('lsp.servers').servers_list) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
  }
end
