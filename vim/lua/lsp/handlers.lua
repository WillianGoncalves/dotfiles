local M = {}

M.setup = function()
  local config = {
    virtual_text = false,
    update_in_insert = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = ' Diagnostics:',
      prefix = function (diagnostic, i)
        return string.format(' %d. ', i)
      end
    }
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    --width = 60,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    --width = 60,
  })
end

return M
