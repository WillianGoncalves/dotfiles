local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed(require('lsp.servers').servers_list)

-- Source: https://github.com/ray-x/lsp_signature.nvim#full-configuration-with-default-values
local signature_setup = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  hint_enable = false,
  hi_parameter = 'LspSignatureActiveParameter',
  handler_opts = {
    border = "rounded"
  }
}

local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- Code extracted from https://github.com/neovim/nvim-lspconfig
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', 'gdt', '<cmd>tab split | lua vim.lsp.buf.definition()<cr>', bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)
  vim.keymap.set('n', ']e', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts)
  require "lsp_signature".on_attach(signature_setup, bufnr)
end

lsp.on_attach(on_attach)
lsp.set_preferences({
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})
lsp.setup()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end
local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  ["<C-j>"] = cmp.mapping.select_next_item(),
  ['<C-y>'] = cmp.mapping.scroll_docs(-4),
  ['<C-e>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-x>'] = cmp.mapping.abort(),
  -- Accept currently selected item. If none selected, `select` first item.
  -- Set `select` to `false` to only confirm explicitly selected items.
  ['<CR>'] = cmp.mapping.confirm({ select = false }),
  ['<C-c>'] = cmp.mapping({
    c = function(fallback)
      if cmp.visible() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
      else
        fallback()
      end
    end
  }),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expandable() then
      luasnip.expand()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif check_backspace() then
      fallback()
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, {
    "i",
    "s",
  }),
})

local windowConfig = cmp.config.window.bordered({
  -- default winhighlight is: 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None'
  -- see: https://github.com/hrsh7th/nvim-cmp/blob/9897465a7663997b7b42372164ffc3635321a2fe/lua/cmp/config/window.lua
  winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder'
})

local cmp_config = lsp.defaults.cmp_config({
  mapping = cmp_mappings,
  sources = {
    { name = "nvim_lsp", priority = 100 },
    { name = "luasnip", priority = 90 },
    { name = "nvim_lua", priority = 80 },
    { name = 'buffer', priority = 20 },
    { name = "path", priority = 10 },
  },
  window = {
    completion = windowConfig,
    documentation = windowConfig,
  },
})

-- https://github.com/VonHeikemen/lsp-zero.nvim/discussions/53
cmp.setup(cmp_config)

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path', priority = 10 }
  }, {
    { name = 'cmdline', priority = 70 }
  })
})

local diagnostic_config = {
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

vim.diagnostic.config(diagnostic_config)
