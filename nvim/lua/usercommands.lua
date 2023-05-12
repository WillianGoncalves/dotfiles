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

-- close tabs to the right
vim.api.nvim_create_user_command(
  'Qr',
  '.+1,$tabdo :tabc',
  {}
)
