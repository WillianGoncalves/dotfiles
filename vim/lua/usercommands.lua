-- format json
vim.api.nvim_create_user_command(
  'FormatJson',
  'set syntax=json | %!python -m json.tool',
  {}
)

-- close other tabs
vim.api.nvim_create_user_command(
  'Q',
  '%bd|e#',
  {}
)
